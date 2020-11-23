#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include "cacheutils.h"

/*
 * NOTE: the following ensures vote_a and vote_be are placed on different
 * memory pages, so that they are guaranteed to fall in different cache lines.
 * We also make sure the lines are sufficiently far apart so the CPU prefetcher
 * does not introduce noise...
 */
#define PAGE_SIZE   0x1000
#define LINE_SIZE   64
#define LINE_A      2
#define LINE_B      15
char __attribute__((aligned(PAGE_SIZE))) my_buf[PAGE_SIZE] = {0};
#define votes_a     my_buf[LINE_A*LINE_SIZE+2]
#define votes_b     my_buf[LINE_B*LINE_SIZE+2]

void secret_vote(char candidate)
{
    if (candidate == 'a')
        votes_a++;
    else
        votes_b++;
}

int compare(const void * a, const void * b) {
   return ( *(uint64_t*)a - *(uint64_t*)b );
}

int main()
{
    uint64_t num_cycles = 100;
    uint64_t timing_cycles[num_cycles];
    uint64_t median;

    for (int i = 0; i < num_cycles; i++){
        flush(&votes_a); //Attacker

        secret_vote('a'); //Victim (Change this)

        timing_cycles[i] = reload(&votes_a); //Attacker
    }

    qsort(timing_cycles, num_cycles, sizeof(uint64_t), compare);
    median = timing_cycles[num_cycles/2];

    printf("Thank you, your vote has been securely registered.\n");
    printf("Median time: %li\n", median);
    /*If the victim voted for 'a', than the median access time for 'a' from the attacker will be low.
    Otherwise, if the victim voted for 'b', than the median access time for 'a' from the attacker will be high.*/
    return 0;
}
