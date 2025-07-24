#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

extern "C" {

__attribute__((weak))
extern int LLVMFuzzerTestOneInput(const unsigned char *data, size_t size);
__attribute__((weak))
extern int LLVMFuzzerInitialize(int *argc, char ***argv);
__attribute__((weak))
int main(int argc, char **argv) {
  if (LLVMFuzzerInitialize)
    LLVMFuzzerInitialize(&argc, &argv);
  for (int i = 1; i < argc; i++) {
    FILE *f = fopen(argv[i], "r");
    assert(f);
    fseek(f, 0, SEEK_END);
    size_t len = ftell(f);
    fseek(f, 0, SEEK_SET);
    unsigned char *buf = (unsigned char*)malloc(len);
    size_t n_read = fread(buf, 1, len, f);
    fclose(f);
    assert(n_read == len);
    LLVMFuzzerTestOneInput(buf, len);
    free(buf);
  }
  return 0;
}

}