#v03/zad01
#sabrati elemente niza od indeksa 3 do indeksa 5
#autor: Kosta Svrdlan, E2
.section .data
NELEM = 10
prvi:
	.long 3
posl:
	.long 5
niz:
	.long 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
sum:
	.long 0
.section .text
.global main
main:
	movl sum , %eax         #suma s
	movl prvi, %ebx         #prvi element
	movl posl, %ecx         #poslednji element
	movl %ebx, %edx         #brojac br = prvi
pocetak:
	addl niz(,%edx,4), %eax #s += niz[br]
	incl %edx               #br++
	cmpl %ecx, %edx 
	jle  pocetak            #ako je br < posl ponavlja postupak
rezultat:
	movl %eax, sum          #vraca sumu u memoriju
kraj:
	movl $1  , %eax
	movl $0  , %ebx
	int  $0x80