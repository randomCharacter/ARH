/*
*	v05/zad04
*	Napisati C program koji poziva funkciju int saberi_niz(long long *a, long long *b, long long *c, int n)
*	iz asemblerskog potprograma
*/

#include <stdio.h>

int saberi_niz(long long *a, long long *b, long long *c, int n);
 
#define LEN 5
long long a[LEN] = {123LL, -456LL, 0LL, 17LL, 55LL};
long long b[LEN] = {1234LL, 1456LL, 1110LL, 1745LL, -545LL};
long long r[LEN];
 
int print_niz(char ime, long long *niz, int n) {
    int i;
    for (i=0;i<n;i++)
        printf("%c[%d]=%lld\n",ime,i,niz[i]);
}
 
int main() {
    int g;
    print_niz('a',a,LEN);
    print_niz('b',b,LEN);
    g = saberi_niz(a,b,r,LEN);
    if (g == 0)
        print_niz('r',r,LEN);
    else
        printf("Došlo je do greške!\n");
    return g;
}