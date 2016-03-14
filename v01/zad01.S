#zad01
#izracunati zbir prvih n brojeva
#autor: Mario Peric, E2
.section .data
.section .text
.globl main
main:
	movl $5  , %eax #n = 5
	movl $0  , %ebx #s = 0, suma
pocetak:
	addl %eax, %ebx #s += n
	decl %eax       #n--
	cmpl $0  , %eax #ako je n == 0 zavrsava program 
	jne pocetak     #inace se ponovi
kraj:
	movl $1  , %eax
	movl $0  , %ebx
	int  $0x80