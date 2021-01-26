//#include <stdio.h>
#include <stdlib.h>
//#include <dlfcn.h>
#include "./include/dart_api_dl.c"


typedef struct {
    bool finished;
    uint32_t request_id;
    uint32_t response_type;
    char* params_json;
} dart_response_t;

typedef struct {
    char* content;
    uint32_t len;
} tc_string_data_t;

int64_t m_iNativePort = -1;

/*void tonsdk_dart_setNativeport(int64_t iPort) {
    m_iNativePort = iPort;
}*/

void dart_set_nativeport(int64_t iPort) {
    m_iNativePort = iPort;
}

int64_t dart_get_nativeport() {
    return m_iNativePort;
}

void dart_post_object(void *response)
{
    Dart_CObject dart_object;
    dart_object.type = Dart_CObject_kInt64;
    dart_object.value.as_int64 = (int64_t)response;
    Dart_PostCObject_DL(m_iNativePort,&dart_object);
}

void dart_clear_response(void* ptr)
{
    dart_response_t *response = (dart_response_t*)ptr;
    free(response->params_json);    
    free(response);
}



void cstyle_response_handler(uint32_t request_id, tc_string_data_t params_json, uint32_t response_type, bool finished)
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
        //fputs ("No nativeport!", stderr);
        exit(1);
    }
}



