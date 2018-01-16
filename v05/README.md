# v05
## zad01
napisati potprogram koji racuna NZD dva broja, kao i program koji ga poziva u istom fajlu   
<b>int NZD(int A, int B)</b>   
`gcc -g -m32 zad01.S`(<i>potprogram i program u istom fajlu</i>)
## zad02
napisati potprogram koji racuna n-ti fibonacijev broj i vraca rezultat, kao i program koji ga poziva   
<b>int fib(int n)</b>   
`gcc -g -m32 zad02.S zad02_pod.S`(<i>potprogram i program se nalaze u razlicitim fajlovima</i>)
## zad03
napisati potprogram koji racuna n-ti fibonacijev broj, a rezultat smesta u drugu promenljivu, vraca 0 ako je uspeo, 1 ako nije i C program koji ga poziva   
<b>int fib(int n, int *rez)</b>   
`gcc -g -m32 zad03.c zad03_pod.S`(<i>potprogram je u S fajlu, a glavni program u C fajlu</i>)
## zad04
napisati potprogram koji racuna elemente niz C po sledecoj formuli c[i] = a[i] + b[i] u dvostrukoj preciznosti, kao i C program koji ga poziva   
<b>int saberi_niz(long long *a, long long *b, long long *c, int n)</b>   
`gcc -g -m32 zad03.c zad03_pod.S`(<i>potprogram i program se nalaze u razlicitim fajlovima</i>)
## zad05
napisati potprogram koji racuna n-ti clan fibonacijevog niza rekurzivno   
<b>int fib(int n)</b>   
`gcc -g -m32 zad04.c zad04_pod.S`(<i>potprogram je u S fajlu, a glavni program u C fajlu</i>)
