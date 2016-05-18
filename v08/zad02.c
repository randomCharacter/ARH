/*
*   v08/zad02
*   Napisati potprogram unsigned int oct_str_float_to_inter(char* str, unsigned int* greska)
*   koji prevodi broj iz opsteg razlomljenog oktalnog znakovnog oblika u interni oblik
*/
#include <stdio.h>

unsigned int oct_str_float_to_inter(char* str, unsigned int* greska);

int test(char* b) {
    char s[20];
    unsigned int g,r;
    printf("Ulaz  : oct_str_float_to_inter(\"%s\",&g)\n",b);
    r = oct_str_float_to_inter(b,&g);
    printf("Greška: %u\n",g);
    if (g == 0)
        printf("Izlaz : %u\n",r);
    printf("\n");
}

int main() {
    test("123 4567");       //greška
    test("12345678");       //greška
    test("12345671234567"); //ok >= "163264829" (0.163264829)
    test("12345671");       //ok >= "163264811" (0.163264811)
    test("12");             //ok (iz praktikuma)
}
