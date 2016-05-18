/*
*   v08/zad01
*   Napisati potprogram ununsigned int oct_str_to_inter(char* str, unsigned int* greska)
*   koji prevodi oktalni broj koji se nalazi u stringu str i kao rezultat vraca dobijeni
*   broj u internom obliku, pri cemu je drugi parametar greska 0 samo ako je konverzija uspela
*/
#include <stdio.h>

unsigned int oct_str_to_inter(char* str, unsigned int* greska);

int test(char* b) {
    char s[20];
    unsigned int g,r;
    printf("Ulaz  : oct_str_to_inter(\"%s\",&g)\n",b);
    r = oct_str_to_inter(b,&g);
    printf("Greška: %u\n",g);
    if (g == 0)
        printf("Izlaz : %u\n",r);
    printf("\n");
}

int main() {
    test("123 4567");       //greška
    test("12345678");       //greška
    test("12345671234567"); //greška
    test("12345671");       //ok
}
