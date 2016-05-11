/*
*   v07/zad02
*   Napisati podprogram unsigned int inter_to_oct_str(int broj, char* str, unsigned int duzina)
*   koji ce konvertovati broj br u oktalni oblik i to smestiti u str, pri cemu ce voditi racuna
*   o tome da on moze da stane u max duzina cifara i vraca adekvatnu gresku kao rezultat izvrsavanja
*/
#include <stdio.h>

unsigned int inter_to_oct_str(int broj, char* str, unsigned int duzina);

//pomoćni potprogram za testiranje
//prvi parametar je vrednost koja se konvertuje
//drugi parametar je koliko znakova će biti na raspolaganju za konverziju
int test(unsigned int b, unsigned int d) {
    char s[20];
    unsigned int g;
    printf("Ulaz  : inter_to_oct_str(%d,s,%d)\n",b,d);
    g = inter_to_oct_str(b,s,d);
    printf("Greška: %u\n",g);
    if (g == 0) {
        printf("String: %s\n",s);
    }
    printf("\n");
}

int main() {
    test(-12345678,5);   //greška
    test(-12345678,9);   //greška
    test(-12345678,10);  //ok
}