/*
    Runtime library, for use in compiled MiniJava programs
 */

#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

extern int32_t Lmain(int32_t);

// Allocate <size> bytes of memory space and initialise it with zeroes
int32_t L_halloc(int32_t size) { return (int32_t)calloc(size, 1); }

// Print an integer to the standard output
int32_t L_println_int(int32_t n) {
  printf("%" PRId32 "\n", n);
  return 0;
}

// Write character to standard output
int32_t L_write(int32_t n) {
  putchar(n);
  return 0;
}

// Read character from standard input
int32_t L_read() { return getchar(); }

// Abort the execution with an error code
int32_t L_raise(int32_t rc) {
  fprintf(stderr, "Program terminated with error code %" PRId32, rc);
  exit(rc);
  return 0;
}

// Actual entry point: wrapper around the compiled main method
// of the main class of the MiniJava program
int main() {
  Lmain(0); // call main method with dummy argument for (unused) string array
  return 0;
}
