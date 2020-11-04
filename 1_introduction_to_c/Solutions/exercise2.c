#include <stdio.h>

void print_array(int array[], size_t array_size) {
  size_t i;
  for (i = 0; i < array_size; i++) {
    printf("%i ", array[i]);
  }
  printf("\n");
}

int main(void) {
  int n;
  int array[] = {1, 2, 3, 4, 5};

  size_t array_size = sizeof(array) / sizeof(int);
  print_array(array, array_size);

  printf("Enter a number:\n");
  scanf("%d", &n);

  for (size_t i = 0; i < array_size; i++) {
    array[i] = array[i] * n;
    // same as:
    // array[i] *= n;
  }
  print_array(array, array_size);
  return 0;
}
