use std::os::raw::{c_char};
use std::ffi::{CString, CStr};

extern crate libc;
extern crate ton_client;

pub use ton_client::{create_context, destroy_context, request};

use std::future::Future;

mod dart_array;
mod into_dart;

#[cfg(feature = "catch-unwind")]
mod catch_unwind;

pub mod ffi;
pub use into_dart::IntoDart;


//let _isolate;
static mut NATIVE_PORT:i64 = -1;



// Please don't use `AtomicPtr` here
// see https://github.com/rust-lang/rfcs/issues/2481
static mut POST_COBJECT: Option<ffi::DartPostCObjectFnType> = None;
/*#[link(name = "dartnativeport")]
extern {
    fn dart_set_nativeport(iPort: i64);
    fn dart_post_object(obj: *mut DartResponse);
    fn Dart_InitializeApiDL(obj: *mut libc::c_void) -> libc::intptr_t;
}*/

/*#[no_mangle]
pub unsafe extern "C" fn dart_initialize_api_dl(obj: *mut libc::c_void) -> libc::intptr_t
{
    return Dart_InitializeApiDL(obj);
}*/

#[no_mangle]
pub unsafe extern "C" fn dart_create_context(port: i64, config: *const c_char) -> *mut c_char {
    //dart_set_nativeport(port) ;
    NATIVE_PORT = port;
    //println!("Native prot in rust {}",native_port);
    let c_str: &CStr = CStr::from_ptr(config);
    let str_slice: &str = c_str.to_str().unwrap();
    let str_buf: String = str_slice.to_owned(); 

    let res = create_context(str_buf);

    return  CString::new(res.as_str()).unwrap().into_raw();
}

#[no_mangle]
pub unsafe extern "C" fn dart_destroy_context(context: u32) {
    //dart_set_nativeport(-1);
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
    //println!("dart_response_handler Native prot in rust {}",request_id);
    let int_ptr = response as *const _ as i64;
    unsafe{
    //println!("dart_response_handler Native prot in rust {}",native_port);
    Isolate::new(NATIVE_PORT).post(int_ptr);
    }


    //unsafe{dart_post_object(response);}
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
    ptr: ffi::DartPostCObjectFnType,
) {
    POST_COBJECT = Some(ptr);
}

/// Simple wrapper around the Dart Isolate Port, nothing
/// else.
#[derive(Copy, Clone, Debug)]
pub struct Isolate {
    port: i64,
}

impl Isolate {
    /// Create a new `Isolate` with a port obtained from Dart VM side.
    ///
    /// #### Example
    /// this a non realistic example lol :D
    /// ```rust
    /// # use allo_isolate::Isolate;
    /// let isolate = Isolate::new(42);
    /// ```
    pub const fn new(port: i64) -> Self { Self { port } }

    /// Post an object to the [`Isolate`] over the port
    /// Object must implement [`IntoDart`].
    ///
    /// returns `true` if the message posted successfully, otherwise `false`
    ///
    /// #### Safety
    /// This assumes that you called [`store_dart_post_cobject`] and we have
    /// access to the `Dart_PostCObject` function pointer also, we do check
    /// if it is not null.
    ///
    /// #### Example
    /// ```rust
    /// # use allo_isolate::Isolate;
    /// let isolate = Isolate::new(42);
    /// isolate.post("Hello Dart !");
    /// ```
    pub fn post(&self, msg: impl IntoDart) -> bool {
        unsafe {
            if let Some(func) = POST_COBJECT {
                let boxed_msg = Box::new(msg.into_dart());
                let ptr = Box::into_raw(boxed_msg);
                // Send the message
                let result = func(self.port, ptr);
                // free the object
                let boxed_obj = Box::from_raw(ptr);
                drop(boxed_obj);
                // I like that dance haha
                result
            } else {
                false
            }
        }
    }

    /// Consumes `Self`, Runs the task, await for the result and then post it
    /// to the [`Isolate`] over the port
    /// Result must implement [`IntoDart`].
    ///
    /// returns `true` if the message posted successfully, otherwise `false`
    ///
    /// #### Safety
    /// This assumes that you called [`store_dart_post_cobject`] and we have
    /// access to the `Dart_PostCObject` function pointer also, we do check
    /// if it is not null.
    ///
    /// #### Example
    /// ```rust,ignore
    /// # use allo_isolate::Isolate;
    /// use async_std::task;
    /// let isolate = Isolate::new(42);
    /// task::spawn(isolate.task(async { 1 + 2 }));
    /// ```
    pub async fn task<T, R>(self, t: T) -> bool
    where
        T: Future<Output = R> + Send + 'static,
        R: Send + IntoDart + 'static,
    {
        self.post(t.await)
    }

    /// Similar to [`Isolate::task`] but with more logic to catch any panic and
    /// report it back
    #[cfg(feature = "catch-unwind")]
    pub async fn catch_unwind<T, R>(
        self,
        t: T,
    ) -> Result<bool, Box<dyn std::any::Any + Send>>
    where
        T: Future<Output = R> + Send + 'static,
        R: Send + IntoDart + 'static,
    {
        catch_unwind::CatchUnwind::new(t)
            .await
            .map(|msg| Ok(self.post(msg)))?
    }
}