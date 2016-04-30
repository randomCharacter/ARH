#Pripremni zadaci za Test12
##zad01
Napisati potprogram koji vraća rezultat računske operacije između <b>dve 64-bitne označene promenljive A i B</b>, u zavisnosti od parametra operacija. Ukoliko operacija ima vrednost:   
	‘+’, vratiti <b>zbir A+B</b>,   
	‘-’, vratiti <b>razliku A-B</b>,   
	‘*’, vratiti <b>proizvod A*B</b>   
U slučaju da operacija ima neku drugu vrednost, promenljivu greška postaviti na 1.   
U slučaju da dođe do prekoračenja opsega, promenljivu greška postaviti na -1.   
U svim ostalim slučajevima, promenljivu greška postaviti na 
0.   
Deklaracija potprograma je data sa:
<b>long long Racunaj(long long *A, long long *B, char *operacija, int *greska);</b>   
gde su A, B, operacija i greška pokazivači na odgovarajuće parametre. Za testiranje je dat glavni program [<b>zad1.c</b>](./zad1.c).   
Detaljnije objašnjenje algoritma za množenje nalazi se u fajlu [proizvod.md](./proizvod.md)
##zad02
Napisati potprogram koji proverava da li se <b>označene 64-bitne vrednosti u nizu A</b> nalaze u otvorenom intervalu (-123456789000, 123456789000). Ukoliko dati član niza nije u intervalu, dodati mu 10000, u suprotnom ga celobrojno pomnožiti sa 10. Povratna vrednost potprograma je broj elemenata niza koji se nalaze u intervalu. Deklaracija potprograma je data sa:   
<b>int DodajMnozi(long long *A, unsigned N);</b>   
gde je <b>A</b> pokazivač na niz 64-bitnih vrednosti, a <b>N</b> broj elemenata niza. U slučaju prekoračenja opsega vratiti <b>-1</b>. Za testiranje je dat glavni program [<b>zad2.c</b>](./zad2.c).
##zad03
Napisati potprogram koji proverava da li u prosleđenom ASCII stringu postoje neki od znakova <b>!, #, $, %, &, /, *</b>. Ukoliko postoje izbaciti ih iz stringa i kao povratnu vrednost vratiti <b>1</b>. U suprotnom vratiti <b>0</b>. Deklaracija potprograma je data sa:   
<b>int Izbaci(char *str);</b>   
gde je str pokazivač na string kojeg treba proveriti. Za testiranje je dat glavni program [<b>zad3.c</b>](./zad3.c).
##zad04
Napisati potprogram koji ispituje neoznačene <b>16-bitne vrednosti u nizu A</b>. Ukoliko član niza ima paran broj binarnih jedinica, zameniti sadržaje njegova prva 3 i poslednja 3 bita. U suprotnom zameniti sadržaje njegovog prvog i poslednjeg bita. Povratna vrednost potprograma je broj elemenata niza koji imaju paran broj binarnih jedinica. Deklaracija potprograma je data sa:   
<b>int RazmeniBit(unsigned short *A, unsigned N);</b>
gde je <b>A</b> pokazivač na niz 16-bitnih vrednosti, a <b>N</b> broj elemenata niza. Za testiranje je dat glavni program [<b>zad4.c</b>](./zad4.c).
