#include <stdio.h>
unsigned long fac(int n){
    int result = 1;
    for (int i = 1; i <= n; i++){
        result *= i;
    }
    return result;
};

int main(){
    int n;
    printf("Input a number\n");
    scanf("%d", &n);
    if(n < 0) return -1;
    printf("Factorial is: %i", fac(n));
}
