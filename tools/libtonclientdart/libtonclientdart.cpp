#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>
#include "./include/dart_api_dl.c"
#include "tonclient.h"


typedef struct {
    bool finished;
    uint32_t request_id;
    uint32_t response_type;
    char* params_json;
} dart_response_t;

int64_t m_iNativePort = -1;

extern "C" void tonsdk_dart_set_nativeport(int64_t iPort) {
    m_iNativePort = iPort;
}

extern "C" char* tonsdk_dart_tc_create_context(char* config, int len)
{
    if (m_iNativePort!=-1) return NULL;
    tc_string_data_t sdata;
    sdata.len = len;
    sdata.content = (char *)malloc(len * sizeof(char));
    memcpy(sdata.content,config,len);

    tc_string_handle_t* strHandle = tc_create_context(sdata);
    tc_string_data_t res = tc_read_string(strHandle);

    char *newval = (char *)malloc((len+1) * sizeof(char));
    newval[res.len]='\0';
    memcpy(newval,res.content,res.len);

    tc_destroy_string(strHandle);

    free(sdata.content);
    return newval;
}

extern "C" void tonsdk_dart_tc_destroy_context(uint32_t context)
{
    tc_destroy_context(context);
    m_iNativePort = -1;
}

extern "C"  void tonsdk_dart_clear_response(void* ptr)
{
    dart_response_t *response = (dart_response_t*)ptr;
    free(response->params_json);    
    free(response);
}

void responseHandler(uint32_t request_id, tc_string_data_t params_json, uint32_t response_type, bool finished)
{
    if (m_iNativePort != -1){

        dart_response_t *response = (dart_response_t*)malloc(sizeof(dart_response_t));
        response->finished = finished;
        response->request_id = request_id;
        response->response_type = response_type;

        char *newval = (char *)malloc((params_json.len+1) * sizeof(char));
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
        fputs ("No nativeport!", stderr);
        exit(1);
    }
}

extern "C" void tonsdk_dart_tc_request(uint32_t context,char *function_name, int fn_len,  char *function_params_json, int fpj_len, uint32_t request_id)
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

    tc_request(context,fnData,jsonData,request_id,responseHandler);
/////////////////////////////////////////////////////////////////////////////////////
}



