/*
*	v05/zad03
*	Napisati C program koji pozifa funkciju int fib(int x, int *res)
*	iz asemblerskog podprograma.
*/
#include <stdio.h>

int fib(int x, int *res);

int main(int argc, char const *argv[])
{
	int x, res = 0;
	printf("Unesite broj: ");
	scanf("%d", &x);
	if (!fib(x, &res))  //! - vraca nulu ako je uspeo
		printf("fib[%d] = %d\n", x, res);
	else
		printf("Doslo je do prekoracenja\n");
	return 0;
}