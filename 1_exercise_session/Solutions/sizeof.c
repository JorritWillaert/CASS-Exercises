#include <stdio.h>
int main() //Note that these sizes are machine specific!
{
    printf("  Bytes in char: %lu\n", sizeof(char));
    printf(" Bytes in char*: %lu\n", sizeof(char*)); //char* is a memory address, so sizeof(char*) is the size of a memory address
    printf("   Bytes in int: %lu\n", sizeof(int));
    printf("  Bytes in uint: %lu\n", sizeof(unsigned int));
    printf("  Bytes in long: %lu\n", sizeof(long));
    printf(" Bytes in ulong: %lu\n", sizeof(unsigned long));
    printf(" Bytes in float: %lu\n", sizeof(float));
    printf("Bytes in double: %lu\n", sizeof(double));
}
