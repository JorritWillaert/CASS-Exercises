#include <stdio.h>

int main(void) {
  int n;

  printf("Enter a number:\n");
  scanf("%d", &n);

  printf("Address of int: %p\n", (void *)&n);
  printf("Value of int: %i\n", n);
  printf("Size of int: %lu\n", sizeof(n));

  int *p = &n;
  printf("Address of pointer: %p\n", (void *)&p);
  printf("Value of pointer: %p\n", (void *)p);
  printf("Size of pointer: %lu\n", sizeof(p));

  return 0;
}
