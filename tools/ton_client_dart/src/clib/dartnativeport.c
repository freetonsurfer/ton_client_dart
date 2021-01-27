//#include <stdio.h>
#include <stdlib.h>
//#include <dlfcn.h>
#include "./include/dart_api_dl.c"

int64_t m_iNativePort = -1;

void dart_set_nativeport(int64_t iPort) {
    m_iNativePort = iPort;
}

void dart_post_object(void *response)
{
    Dart_CObject dart_object;
    dart_object.type = Dart_CObject_kInt64;
    dart_object.value.as_int64 = (int64_t)response;
    Dart_PostCObject_DL(m_iNativePort,&dart_object);
}




