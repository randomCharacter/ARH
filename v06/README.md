# v06
## zad01
napisati asemblerski potprogram maska koji za argumente prima dva neoznacena broja n i v koji predstavljaju redom redni broj bita i vrednost bita na koju treba da postavi, dok sve ostale bitove u datom broju treba da postavlja na suprotnu vrednost.  
za testiranje dat je glavni program [<b>zad01.c</b>](./zad01.c).
<b>unsigned int maska(unsigned int n, unsigned int v)</b>   
primeri:  
<b>n</b> = 3  <b>v</b> = 1  
00000000000000000000000000001000  
<b>n</b> = 4  <b>v</b> = 0  
11111111111111111111111111101111  
<b>n</b> = 32 <b>v</b> = 1  
0, <b>greska</b>  
<b>n</b> = 3  <b>v</b> = 2  
0, <b>greska</b>  
## zad02
napisati asemblerski potprogram maska64 koji za argumente prima 2 neoznacena broja n i v koji predstavljaju redom redni broj bita i vrednost bita 64-bitnog broja na koju treba da postavi, dok sve ostale bitove datog broja postavlja na suprotnu vrednost  
za testiranje dat je glavni program [<b>zad02.c</b>](./zad02.c).
<b>unsigned long long maska(unsigned int n, unsigned int v)</b>  