#include <stdio.h>
#include <string.h>
int main(){
    printf("Please input a string\n");
    int max = 100;
    char string[max];
    fgets(string, max, stdin);
    int length_of_string = strlen(string);
    printf("The length of the string is: %i\n", length_of_string);
    int length_of_string2 = 0;
    char* pointer = string;
    while(*pointer != '\0'){
        pointer += 1;
        length_of_string2 += 1;
    }
    printf("The length of the string is: %i, calculated in a self-made manner.\n", length_of_string2);
    //Note that the length is one longer than you might expect. That's because of the line feed = regelopschuiving (\n which is included)
}
