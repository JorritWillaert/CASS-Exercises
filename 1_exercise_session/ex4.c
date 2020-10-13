#include <stdio.h>

struct ings{
    float floating;
    double doubling;
    long longing;
    char* stringing; //Stores the first letter of the string
    char charing;
};

int main(){
    size_t size_of_struct = sizeof(struct ings);
    struct ings ings1;
    printf("The size of the struct is %lu\n", size_of_struct);
    printf("The adress of the float is %p, the address of the double is %p, the address of the long is %p, the address of the string is %p and the address of the char is %p\n", &ings1.floating, &ings1.doubling, &ings1.longing, &ings1.stringing, &ings1.charing);
    printf("The length of floats is %lu, the length of doubles is %lu, the length of longs is %lu, the length of strings is determined by the input and the length of chars is %lu\n", sizeof(float), sizeof(double), sizeof(long), sizeof(char));
}
