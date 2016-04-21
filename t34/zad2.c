#include <stdio.h>
#include <stdlib.h>

int DodajMnozi(long long *A, unsigned N);

int main()
{
    int br_opseg=0;
    int i;
    int n=5;
    long long niz[5]={123456789000LL, 5LL, 0LL, -123456789001LL, 4000000000LL};

	printf("Niz pre poziva DodajMnozi():\n");
	for(i=0;i<n;i++){
		printf(" %lld \n", niz[i]);

	}

    br_opseg=DodajMnozi(niz, n);


	printf("Niz posle poziva DodajMnozi():\n");
	for(i=0;i<n;i++){
		printf(" %lld \n", niz[i]);

	}
	printf("Broj el. u opsegu = %d\n\n", br_opseg);

    return 0;
}
