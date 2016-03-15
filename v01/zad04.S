#v01/zad04
#izracunati faktorijel broja n
#autor: Mario Peric, E2
.section .data
.section .text
.globl main
main:
	movl $5  , %eax #n = 5
	movl $1  , %ebx #f = 0, trazeni faktorijel
	movl $0  , %ecx #t = 0, pomocna promenljiva
	movl $0  , %edx #z = 0, pomocna promenljiva
pocetak:
	cmpl $0  , %eax 
	je   kraj       #ako je n == 0 zavrsava program
	movl %eax, %ecx #t = n
	movl $0  , %edx #z = 0
	decl %eax       #n--
mnozenje:
	addl %ebx, %edx #f += z
	decl %ecx       #t--
	cmpl $0  , %ecx 
	jne  mnozenje   #ako je t != 0 mnozenje se nastavlja
	movl %edx, %ebx #f = z
	jmp  pocetak    #proces se nastavlja za sledeci broj 
kraj:
	movl $1  , %eax
	movl $0  , %ebx
	int  $0x80