#include <stdio.h>

struct my_struct {
  float a;
  double b;
  long c;
  char *d;
  char e;
};

int main(void) {
  printf("Size of struct: %lu\n", sizeof(struct my_struct));

  struct my_struct my_instance;
  printf("Address of float: %p\n", (void *)&my_instance.a);
  printf("Address of double: %p\n", (void *)&my_instance.b);
  printf("Address of long: %p\n", (void *)&my_instance.c);
  printf("Address of char*: %p\n", (void *)&my_instance.d);
  printf("Address of char: %p\n", (void *)&my_instance.e);

  return 0;
}
