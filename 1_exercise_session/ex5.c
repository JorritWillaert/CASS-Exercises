#include <stdio.h>
int main(){
    printf("Input a string please\n");
    int max = 100; //Max number of characters in the string = 100
    char string[max];
    fgets(string, max, stdin);
    char* c;
    for(c = string; *c != '\0'; c++){
        printf(" %02x %c", *c, *c);
    }
    printf("\n");
}
