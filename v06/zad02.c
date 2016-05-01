/*
*   v06/zad01
*   Napisati potprogram unsigned long long maska(unsigned int n, unsigned int v)
*   gde n predstavlja poziciju bita koju zelimo da postavimo, 
*   a v predstavlja vrednost na koju zelimo da postavimo.
*   Raditi u dvostrukoj preciznosti
*   Dat je c program koji ga poziva.
*/
#include <stdio.h>
 
unsigned long long maska64(unsigned int n, unsigned int v);
 
void printbin64(unsigned long long x) {
    unsigned long long m=0x8000000000000000ULL;
    int s=0;
    while(m) {
        printf("%s%s",m&x ? "1" : "0",++s%8 ? "" : " ");
        m >>= 1;
    }
}
 
int main() {
    unsigned long long r;
    unsigned int n=15,v=1;
    r = maska64(n,v);
    printf("Maska za n=%d, v=%d je: ",n,v);
    printbin64(r);
    printf("\n");
    return 0;
}