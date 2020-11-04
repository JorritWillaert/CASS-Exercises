#include <stdio.h>
struct person {
  int age;
  char* first_name;  //Store the address to the first letter of the string
  char* last_name;
};
int main()
{
  struct person p;
  printf("Size: %lu\n", sizeof(struct person));
  p.age = 54;
  p.first_name = "James"; //We can't store a string in struct, but we can store the address to the first letter of the string. These strings are stored in a special part of memory.
  p.last_name = "May";
  printf("Size: %lu\n", sizeof(p));
  printf(" Address: %p\n", &p);
  printf("Age addr: %p\n", &p.age);
  printf(" FN addr: %p\n", p.first_name); //These last two addresses are not even close to the first two, since strings are stored in a special part of memory.
  printf(" LN addr: %p\n", p.last_name);
}
