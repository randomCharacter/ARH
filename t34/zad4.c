#include <stdio.h>
#include <stdlib.h>

int RazmeniBit(unsigned short *A, unsigned N);

int main()
{
    int br_par=0;
    int i;
    int n=5;
    unsigned short niz[5]={20, 7, 5, 65532, 17};

	printf("Niz pre poziva RazmeniBit():\n");
	for(i=0;i<n;i++){
		printf(" %04x \n", niz[i]);

	}

    br_par=RazmeniBit(niz, n);


	printf("Niz posle poziva Razmeni Bit():\n");
	for(i=0;i<n;i++){
		printf(" %04x \n", niz[i]);

	}
	printf("Broj el. sa parnim br. jedinica = %d\n\n", br_par);

    return 0;
}
