/*
*	v06/zad01
*	Napisati potprogram unsigned int maska(unsigned int n, unsigned int v)
*	gde n predstavlja poziciju bita koju zelimo da postavimo, 
*	a v predstavlja vrednost na koju zelimo da postavimo.
*	Dat je c program koji ga poziva
*/
#include <stdio.h>

unsigned int maska(unsigned int n, unsigned int v);

void printbin(unsigned int x) {
	unsigned int m=0x80000000, s=0;
	while(m) {
		printf("%s%s",m&x ? "1" : "0",++s%4 ? "" : "");
		m >>= 1;
	}
}

int main() {
	unsigned int n, v;
	
	for (v=0; v<=2; v++) {
	    printf("Maska za v = %d:\n", v);
    	for (n=0; n<=33; n++) {
    	    if(n == 32) {
    	        printf("\nOvo dole treba da bude greska (vraca 0):\n");
    	    }
	        printbin(maska(n, v));
	        printf("\tn = %2d\n", n);
	    }
	    printf("\n\n");
	}
	
	return 0;
}