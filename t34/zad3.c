#include <stdio.h>

int Izbaci(char *s);

int main()
{
	char str[]="fds$%$%^&*gdjs";
	int izbacio;

	printf("string pre izbacivanja: %s \n", str);

	izbacio=Izbaci(str);

	printf("string posle izbacivanja: %s \n", str);
	printf("povratna vrednost: %d\n", izbacio);
	return 0;
}
