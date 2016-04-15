/*
*	v05/zad05
*	Napisati C program koji poziva rekurzivnu funkciju int fib(int x)
*	iz asemblerskog potprograma
*/
#include <stdio.h>

int fib (int x);

int main() {
	int x;
	printf("Unesite broj: ");
	scanf("%d", &x);
	printf("f[%d] = %d\n", x, fib(x));
	return 0;
}