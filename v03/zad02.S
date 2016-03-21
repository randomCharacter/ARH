#v03/zad02
#pronaci min i max niza
#autor: Kosta Svrdlan, E2
.section .data
NELEM = 10
niz:
	.long 5, 9, 3, 6, 7, 2, 1, 4, 8, 10
min:
	.long 0
max:
	.long 0
.section .text
.globl main
main:
	movl $0  ,%edx          #brojac i = 0
	movl niz(,%edx,4), %ebx #min = niz[i]
	movl niz(,%edx,4), %ecx #max = niz[i]
min_p:
	cmpl niz(,%edx,4), %ebx
	jng  min_sled           #ako nije niz[i] < min nastavlja dalje
	movl niz(,%edx,4), %ebx #min = niz[i]
min_sled:
	incl %edx               #i++
	cmpl $NELEM, %edx
	jl   min_p              #ako je i < n vraca se na pocetak
vrati:
	movl $0, %edx           #i = 0
max_p:
	cmpl niz(,%edx,4), %ecx 
	jnl  max_sled           #ako nije niz[i] > max nastavlja dalje
	movl niz(,%edx,4), %ecx #max = niz[i]
max_sled:
	incl %edx               #i++
	cmpl $NELEM, %edx
	jl   max_p              #ako je i < n vraca se na pocetak
rezultat:
	movl %ebx, min          #vraca min u memoriju
	movl %ecx, max          #vraca max u memoriju
kraj:
	movl $1  , %eax
	movl $0  , %ebx
	int  $0x80