#include <stdio.h>
int main(){
  char abc_1[] = {'a', 'b', 'c'}; //Not yet a string
  char abc_2[] = {'a', 'b', 'c', '\0'}; //A string
  char abc_3[] = "abc"; //Exactly the same as abc_2
  puts(abc_1);
  puts(abc_2);
  puts(abc_3);
  printf("Size 1: %lu\n", sizeof(abc_1));
  printf("Size 2: %lu\n", sizeof(abc_2));
  printf("Size 3: %lu\n", sizeof(abc_3));
  printf("Addr 1: %p\n", abc_1);
  printf("Addr 2: %p\n", abc_2);
  printf("Addr 3: %p\n", abc_3);
}
