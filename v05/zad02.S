#v05/zad02
#program koji poziva potprogram fib
#autor: Mario Peric, E2
.section .data
x:
	.long 5
r:
	.long 0
.section .text
.globl main
main:
	pushl x         #x -> stek
	call fib        #poziv podprograma
	addl $8, %esp   #brisanje steka
	movl %eax, r    #vracanje rezultata
kraj:
	movl $1  , %eax
	movl $0  , %ebx
	int  $0x80