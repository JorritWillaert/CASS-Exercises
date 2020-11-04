#include <stdio.h>
int main()
{
  int arr[] = {1, 2, 3, 4, 5};
  int i;
  printf("   Address of arr: %p\n", arr);  //Note that we don't use an & here to refer to the address, because an array will always be a pointer to the first element of the array.
  for(i = 0 ; i < sizeof(arr)/sizeof(int) ; i++){
    printf("  Value of arr[%i]: %i\n", i, arr[i]); //Once we dereference an array by using brackets and reference a specific index, then arr is not longer an address but the value of arr[i]
    printf("Address of arr[%i]: %p\n", i, &arr[i]);
  }
  printf("      Size of int: %lu\n", sizeof(int));
  printf("      Size of arr: %lu\n", sizeof(arr));
}
