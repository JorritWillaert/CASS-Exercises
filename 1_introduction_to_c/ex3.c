#include <stdio.h>
int main(){
    printf("Please input an integer\n");
    int n;
    scanf("%d", &n);
    printf("The address of your integer is: %p, the value is %i and the size is %lu\n", &n, n, sizeof(n));
    int* pointer;
    pointer = &n;
    printf("The address of your pointer is: %p, the value is %p and the size is %lu\n", &pointer, pointer, sizeof(pointer));
}
