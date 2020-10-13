#include <stdio.h>

unsigned long fac(unsigned int n) {
  unsigned int c;
  long res = 1;
  for (c = 2; c <= n; c++) {
    res *= c;
  }
  return res;
}

int main(void) {
  unsigned int n;
  printf("Enter a number:\n");
  scanf("%u", &n);
  printf("You entered: %u\n", n);
  printf("Result: %lu\n", fac(n));
  return 0;
}
