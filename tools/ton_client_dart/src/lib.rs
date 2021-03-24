use std::os::raw::{c_char};
use std::ffi::{CString, CStr};

extern crate libc;
extern crate ton_client;

pub use ton_client::{create_context, destroy_context, request};

pub mod dart_types;

static mut NATIVE_PORT:i64 = -1;

// Please don't use `AtomicPtr` here
// see https://github.com/rust-lang/rfcs/issues/2481
static mut POST_COBJECT: Option<dart_types::DartPostCObjectFnType> = None;


#[no_mangle]
pub unsafe extern "C" fn dart_create_context(port: i64, config: *const c_char) -> *mut c_char {
    NATIVE_PORT = port;
    let c_str: &CStr = CStr::from_ptr(config);
    let str_slice: &str = c_str.to_str().unwrap();
    let str_buf: String = str_slice.to_owned(); 

    let res = create_context(str_buf);

    return  CString::new(res.as_str()).unwrap().into_raw();
}

#[no_mangle]
pub unsafe extern "C" fn dart_destroy_context(context: u32) {
    NATIVE_PORT = -1;
    destroy_context(context);    
}

#[no_mangle]
pub unsafe extern "C" fn dart_request(context: u32,function_name: *const c_char, function_params_json: *const c_char, request_id: u32){
    let str_function_name: &str = CStr::from_ptr(function_name).to_str().unwrap();
    let str_params_json: &str = CStr::from_ptr(function_params_json).to_str().unwrap();

    request(
        context,
        str_function_name.to_owned(),
        str_params_json.to_owned(),
        request_id, 
        dart_response_handler,
    )
}

#[repr(C)]
#[derive(Clone)]
pub struct DartResponse {
    pub finished: bool,
    pub request_id: u32,    
    pub response_type: u32,    
    pub params_json: *mut c_char,
}

fn dart_response_handler(request_id: u32, params_json: String, response_type: u32, finished: bool)
{
    let response = Box::into_raw(Box::new(DartResponse{
        request_id: request_id,
        params_json: CString::new(params_json.as_str()).unwrap().into_raw(),
        response_type: response_type,
        finished: finished,
    }));
    post_object(response);
}

fn post_object( obj: *const DartResponse) -> bool {
    unsafe {
        if let Some(func) = POST_COBJECT {
            let boxed_msg = Box::new(dart_types::DartCObject {
                ty: dart_types::DartCObjectType::DartInt64,
                value: dart_types::DartCObjectValue { as_int64: obj as i64 },
            });
            let ptr = Box::into_raw(boxed_msg);
            // Send the message
            let result = func(NATIVE_PORT, ptr);
            // free the object
            let boxed_obj = Box::from_raw(ptr);
            drop(boxed_obj);
            result
        } else {
            false
        }
    }
}

#[no_mangle]
pub unsafe extern "C" fn dart_response_free(ptr: *mut libc::c_void)
{
    let response = Box::from_raw(ptr as *mut DartResponse);
    drop(response);
}

#[no_mangle]
pub unsafe extern "C" fn dart_string_free(ptr: *mut c_char) {
    let s = CString::from_raw(ptr);
    drop(s);
}

/// Stores the function pointer of `Dart_PostCObject`, this only should be
/// called once at the start up of the Dart/Flutter Application. it is exported
/// and marked as `#[no_mangle]`.
///
/// you could use it from Dart as following:
///
/// #### Safety
/// This function should only be called once at the start up of the Dart
/// application.
///
/// ### Example
/// ```dart,ignore
/// import 'dart:ffi';
///
/// typedef dartPostCObject = Pointer Function(
///         Pointer<NativeFunction<Int8 Function(Int64,
/// Pointer<Dart_CObject>)>>);
///
/// // assumes that _dl is the `DynamicLibrary`
/// final storeDartPostCObject =
///     _dl.lookupFunction<dartPostCObject, dartPostCObject>(
/// 'store_dart_post_cobject',
/// );
///
/// // then later call
///
/// storeDartPostCObject(NativeApi.postCObject);
/// ```
#[no_mangle]
pub unsafe extern "C" fn store_dart_post_cobject(
    ptr: dart_types::DartPostCObjectFnType,
) {
    POST_COBJECT = Some(ptr);
}