# Pripremni zadaci za Test12
## zad01
Napraviti program koji traži unos stringa str1 (maks dužine 100 bajtova) i nalazi koliko znakova u unetom stringu nisu alfanumerici (nisu ni slovo i nisu cifra). Svaki od tih znakova zameniti znakom ‘0’ (nula) i ispisati tako dobijeni string, a broj zamenjenih karaktera postaviti u 8-bitnu promenljivu not_alphanum i vratiti ga ao izlazni kod programa.
## zad02
Dat je niz niz2, koji je niz označenih 64-bitnih brojeva (dvostruka preciznost). Naći koliko se elemenata niza nalazi van opsega [-5000000000 (minus 5 milijardi), 6000000000 (6 milijardi)].Dobijen broj postaviti u 8-bitnu promenljivu van_opsega i vratiti ga kao izlazni kod programa
## zad03
Dati su nizovi 64-bitnih označenih brojeva A i B sa jednakim brojem elemenata. Formirati niz C na sledeći način:  
•ako jeA[i]>B[i], onda je C[i]=A[i]-B[i]  
•u suprotnom je C[i]=A[i]+B[i]  
U slučaju prekoračenja opsega prilikom računanja, postaviti 32-bitnu promenljivu greska na 1 i prekinuti izvršavanje programa. Ako se program uspešno izvršio, promenljivu greska postaviti na 0.Promenljivu greska vratiti kao izlazni kod programa.