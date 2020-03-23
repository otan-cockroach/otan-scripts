#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>

int main() {
  char *error;

  void *handle = dlopen("/usr/local/lib/libgeos_c.1.dylib", RTLD_LAZY);
  if (!handle) {
    printf("cannot find lib geos\n");
    return 1;
  }

  void *geosHandleFunc = dlsym(handle, "initGEOS");
  if ((error = dlerror()) != NULL) {
    printf("%s\n", error);
    return 1;
  }
  void *geosHandle = ((void*(*)())geosHandleFunc)();

  void *readerFunc = dlsym(handle, "GEOSWKTReader_create_r");
  if ((error = dlerror()) != NULL) {
    printf("%s\n", error);
    return 1;
  }
  void *wktReader = ((void*(*)(void*)) readerFunc)(geosHandle);

  char *decode = "POINT(1.0 1.1)";
  void *readFunc = dlsym(handle, "GEOSWKTReader_read_r");
  if ((error = dlerror()) != NULL) {
    printf("%s\n", error);
    return 1;
  }

  void *geom = ((void*(*)(void*,void*,char*)) readFunc)(geosHandle, wktReader, decode);

  void *writerFunc = dlsym(handle, "GEOSWKTWriter_create_r");
  if ((error = dlerror()) != NULL) {
    printf("%s\n", error);
    return 1;
  }
  void *wktWriter = ((void*(*)(void*)) writerFunc)(geosHandle);
  if ((error = dlerror()) != NULL) {
    printf("%s\n", error);
    return 1;
  }

  void *writeFunc = dlsym(handle, "GEOSWKTWriter_write_r");
  if ((error = dlerror()) != NULL) {
    printf("%s\n", error);
    return 1;
  }
  char *write = ((char*(*)(void*,void*,void*)) writeFunc)(geosHandle, wktWriter, geom);
  printf("wow, we made it - the answer is %s\n", write);

  return 0;
}
