/*
* Copyright 2018-2020 TON DEV SOLUTIONS LTD.
*
* Licensed under the SOFTWARE EVALUATION License (the "License"); you may not use
* this file except in compliance with the License.
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific TON DEV software governing permissions and
* limitations under the License.
*/
use std::os::raw::{c_char};
use std::ffi::{CString, CStr};

extern crate libc;
extern crate ton_client;

pub use ton_client::{create_context, destroy_context, request};

//#[link(name = "hello")]
extern {
    fn dart_set_nativeport(iPort: i64);
    fn dart_get_nativeport() -> i64;
    fn dart_post_object(obj: *mut DartResponse);
    fn Dart_InitializeApiDL(obj: *mut libc::c_void) -> libc::intptr_t;
}

#[no_mangle]
pub unsafe extern fn dart_initialize_api_dl(obj: *mut libc::c_void) -> libc::intptr_t
{
    return Dart_InitializeApiDL(obj);
}

#[no_mangle]
pub unsafe extern "C" fn dart_create_context(port: i64, config: *const c_char) -> *mut c_char {
    dart_set_nativeport(port) ;
    
    let c_str: &CStr = CStr::from_ptr(config);
    let str_slice: &str = c_str.to_str().unwrap();
    let str_buf: String = str_slice.to_owned(); 

    let res = create_context(str_buf);

    return  CString::new(res.as_str()).unwrap().into_raw();
}

#[no_mangle]
pub unsafe extern "C" fn dart_destroy_context(context: u32) {
    dart_set_nativeport(-1);
    destroy_context(context);    
}

#[no_mangle]
pub unsafe extern "C" fn dart_request(context: u32,function_name: *const c_char, function_params_json: *const c_char, request_id: u32){
    let str_function_name: &str = CStr::from_ptr(function_name).to_str().unwrap();
    let str_params_json: &str = CStr::from_ptr(function_params_json).to_str().unwrap();
    /*let sd_function_name = StringData::new(&str_function_name.to_owned());
    let sd_params_json = StringData::new(&str_params_json.to_owned());
    tc_request(
        context,
        sd_function_name,
        sd_params_json,
        request_id, 
        cstyle_response_handler,
    )*/
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
    //if (dart_get_nativeport() != -1){
        
        let response = Box::into_raw(Box::new(DartResponse{
            request_id: request_id,
            params_json: CString::new(params_json.as_str()).unwrap().into_raw(),
            response_type: response_type,
            finished: finished,
        }));

        unsafe{dart_post_object(response);}
}

#[no_mangle]
pub unsafe extern fn dart_response_free(ptr: *mut libc::c_void)
{
    let response = Box::from_raw(ptr as *mut DartResponse);
    drop(response);
}

#[no_mangle]
pub unsafe extern fn dart_string_free(ptr: *mut c_char) {
    //if ptr.is_null() { return }
    let s = CString::from_raw(ptr);
    drop(s);
}



