#zad02
#pomnoziti 2 broja pomocu sabiranja
#autor: Mario Peric, E2
.section .data
.section .text
.globl main
main:
	movl $5  , %eax #n = 5, orvi broj
	movl $7  , %ebx #m = 7, drugi broj
	movl $0  , %ecx #s = 0, suma (proizvod)
pocetak:
	addl %eax, %ecx #s += n
	decl %ebx       #m--
	cmpl $0  , %ebx #ako je m == 0 zavrsava program
	jne  pocetak    #inace se ponovi
kraj:
	movl $1  , %eax
	movl $0  , %ebx
	int  $0x80