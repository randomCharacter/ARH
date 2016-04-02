#proveriti da li je broj u opsegu -5 000 000 000 i 6 000 000 000
#t12/zad02
#autor: Mario Peric, E2
.section .data
NELEM = 4
niz:
	.quad -5000000001, 20, 34, 6000000005
donja:
	.quad -5000000000
gornja:
	.quad 6000000000
van_opsega:
	.long 0
.section .text
.globl main
main:
	movl $0  , %ecx 
pocetak:
	movl niz(,%ecx,8), %ebx
	movl niz+4(,%ecx,8), %eax
donja_g:
	cmpl donja+4, %eax
	jl uvecaj
	jg gornja_g
	cmpl donja, %ebx
	jl  uvecaj
gornja_g:
	cmpl gornja+4, %eax
	jg uvecaj
	jl sledeci
	cmpl donja, %ebx
	jg uvecaj
uvecaj:
	incl van_opsega
sledeci:
	incl %ecx
	cmpl $NELEM, %ecx
	jl   pocetak
kraj:
	movl $1, %eax
	movl van_opsega, %ebx
	int  $0x80