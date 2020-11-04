#include <stdio.h>

int main(void) {
  char string[100];
  char *c;

  printf("Enter a string:\n");
  fgets(string, 100, stdin);

  for (c = string; *c != '\0'; c++) {
    printf(" %02x %c", *c, *c);
  }
  printf("\n");

  return 0;
}
