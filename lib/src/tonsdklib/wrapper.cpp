#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>
#include "./include/dart_api_dl.c"

typedef struct {
    char* content;
    uint32_t len;
} tc_string_data_t;

typedef struct  {
} tc_string_handle_t;

typedef void (*tc_response_handler_t)(
    uint32_t request_id,
    tc_string_data_t params_json,
    uint32_t response_type,
    bool finished);

typedef struct {
    bool finished;
    uint32_t request_id;
    uint32_t response_type;
    char* params_json;
} dart_response_t;


void *m_tonsdklib;
void (*m_createRequest)(uint32_t,tc_string_data_t,tc_string_data_t,uint32_t,tc_response_handler_t);
int64_t m_iNativePort = -1;

extern "C" void wrapper_open(char* lib, int len)
{
    char* path = (char *)malloc((len+1) * sizeof(char));
    path[len]='\0';
    memcpy(path,lib,len);
    m_tonsdklib = dlopen (path, RTLD_LAZY);
    if (!m_tonsdklib) {
        fputs (dlerror(), stderr);
        exit(1);
    }

    char* error;
    m_createRequest = (void(*)(uint32_t,tc_string_data_t,tc_string_data_t,uint32_t,tc_response_handler_t))dlsym(m_tonsdklib, "tc_request");
    if ((error = dlerror()) != NULL)  {
        fputs(error, stderr);
        exit(1);
    }
    free(path);	
}

extern "C" void wrapper_close()
{
    dlclose(m_tonsdklib);
    m_iNativePort = -1;
}

extern "C" char* wrapper_tc_create_context(char* config, int len)
{
    char *error;
    
   void* (*createContext)(tc_string_data_t);
   createContext = (void*(*)(tc_string_data_t))dlsym(m_tonsdklib, "tc_create_context");
   if ((error = dlerror()) != NULL)  {
        fputs(error, stderr);
        exit(1);
    }

    tc_string_data_t sdata;
    sdata.len = len;//strlen(config);
    sdata.content = (char *)malloc(len * sizeof(char));//config;
    memcpy(sdata.content,config,len);

    void* hContext = createContext(sdata);

    /////////////////////////////////////////////////////////////////////////////////////
    tc_string_data_t (*readString)(const tc_string_handle_t*);
    readString = (tc_string_data_t(*)(const tc_string_handle_t*))dlsym(m_tonsdklib, "tc_read_string");
    if ((error = dlerror()) != NULL)  {
        fputs(error, stderr);
        exit(1);
    }

    void (*destroyString)(const tc_string_handle_t*);
    destroyString = (void(*)(const tc_string_handle_t*))dlsym(m_tonsdklib, "tc_destroy_string");
    if ((error = dlerror()) != NULL)  {
        fputs(error, stderr);
        exit(1);
    }

    tc_string_data_t res = readString((tc_string_handle_t*)hContext);

    char *newval = (char *)malloc((len+1) * sizeof(char));
    newval[res.len]='\0';
    memcpy(newval,res.content,res.len);

    destroyString((tc_string_handle_t*)hContext);
     /////////////////////////////////////////////////////////////////////////////////////

    free(sdata.content);
    return newval;
}

extern "C" void wrapper_tc_destroy_context(uint32_t context)
{
    char* error;
    void (*destroyContext)(uint32_t);
    destroyContext = (void(*)(uint32_t))dlsym(m_tonsdklib, "tc_destroy_context");
    if ((error = dlerror()) != NULL)  {
        fputs(error, stderr);
        exit(1);
    }
    destroyContext(context);
}

extern "C" void setNativePort(int64_t iPort) {
    m_iNativePort = iPort;
}

extern "C"  void clear_response(void* ptr)
{
    dart_response_t *response = (dart_response_t*)ptr;
    //printf("&OG   = %p\n", response->params_json);
    //fputs(response->params_json, stderr);    
    free(response->params_json);    
    free(response);
}

void responseHandler(uint32_t request_id, tc_string_data_t params_json, uint32_t response_type, bool finished)
{
    if (m_iNativePort != -1){
        //int64_t pp =111;
        dart_response_t *response = (dart_response_t*)malloc(sizeof(dart_response_t));
        response->finished = finished;
        response->request_id = request_id;
        response->response_type = response_type;

        char *newval = (char *)malloc((params_json.len+1) * sizeof(char));//new char[params_json.len+1];
        newval[params_json.len]='\0';
        memcpy(newval,params_json.content,params_json.len);
        response->params_json = newval;
         //fputs(response->params_json, stderr);
         //printf("&G   = %p\n", response->params_json);

        Dart_CObject dart_object;
        dart_object.type = Dart_CObject_kInt64;
        dart_object.value.as_int64 = (int64_t)response;
        Dart_PostCObject_DL(m_iNativePort,&dart_object);
    }else{
        fputs ("No nativeport! use setNativePort function.", stderr);
        exit(1);
    }
}

extern "C" void wrapper_tc_request(uint32_t context,char *function_name, int fn_len,  char *function_params_json, int fpj_len, uint32_t request_id)
{
/////////////////////////////////////////////////////////////////////////////////////
    tc_string_data_t fnData;
    fnData.len = fn_len;//strlen(config);
    fnData.content = (char *)malloc((fn_len /*+ 1*/) * sizeof(char));//config;
    memcpy(fnData.content,function_name,fn_len);

    tc_string_data_t jsonData;
    jsonData.len = fpj_len;//strlen(config);
    jsonData.content = (char *)malloc((fpj_len /*+ 1*/) * sizeof(char));//config;
    memcpy(jsonData.content,function_params_json,fpj_len);

    m_createRequest(context,fnData,jsonData,request_id,responseHandler);
    
    //free(fnData.content);
   //free(jsonData.content);
/////////////////////////////////////////////////////////////////////////////////////
}



