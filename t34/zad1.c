#include <stdio.h>
#include <stdlib.h>

long long Racunaj(long long *A, long long *B, char *operacija, int *greska);


int main()
{
    int greska=5;
    long long rac=0;
    long long A=123456789000LL;
    long long B=10000LL;
    char op='*';

    rac=Racunaj(&A, &B, &op, &greska);

    printf("%lld %c %lld = %lld    greska=%d\n", A, op, B, rac, greska);
    return 0;
}
