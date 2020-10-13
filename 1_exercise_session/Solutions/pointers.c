#include <stdio.h>
int main()
{
    int i = 5;
    int* j = &i;
    int k = *j;
    printf("Value of i: %i\n", i);
    printf("Address of i: %p\n", &i);
    printf("Value of j: %p\n", j);  //We're using the placeholder %p here, because the value of j is an address.
    printf("Address of j: %p\n", &j);
    printf("Value of k: %i\n", k);
    printf("Address of k: %p\n", &k);
}
