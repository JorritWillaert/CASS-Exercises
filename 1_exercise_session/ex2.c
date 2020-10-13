#include <stdio.h>
//See solutions, in a function, you only have a pointer to an array, so you can't calculate the size then anymore.
//So calculate size in main, and give two arguments to the function (array and array_size)

int print_array(int array[], size_t size_of_array){
    for(int i =  0; i < size_of_array/sizeof(int); i++){
        printf("%i ", array[i]);
    }
    printf("\n");
};

int main(){
    int array[] = {1, 2, 3, 4, 5};
    size_t size_of_array = sizeof(array);
    print_array(array, size_of_array);
    printf("Input a multiplying number\n");
    int n;
    scanf("%d", &n);
    for(int i = 0; i < size_of_array / sizeof(int); i++){
        array[i] *= n;
    }
    print_array(array, size_of_array);
}
