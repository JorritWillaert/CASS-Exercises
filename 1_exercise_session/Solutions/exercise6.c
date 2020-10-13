#include <stdio.h>
#include <string.h>

int main(void) {
  char string[100];
  char *c;
  int length = 0;

  printf("Enter a string:\n");
  fgets(string, 100, stdin);
  printf("Length with strlen: %lu\n", strlen(string));

  for (c = string; *c != '\0'; c++) {
    length++;
  }
  printf("Length without strlen: %i\n", length);

  return 0;
}
