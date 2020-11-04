#include <stdio.h>
unsigned long fac(int n) //unsigned long is the return type
{
  if (n == 0){
    return 1;
  }else{
    return(n * fac(n-1));
  }
}
int main(){
  int n;
  printf("Enter a number:\n");
  scanf("%d", &n);
  if(n < 0) return -1;
  printf("Result: %lu\n", fac(n));
  return 0;
}
