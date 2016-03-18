#v01/zad03
#izracunati n-ti element fibonacijevog niza
#autor: Mario Peric, E2
.section .data
.section .text
.globl main
main:
	movl $5  , %eax #n = 5
	movl $1  , %ebx #f1 = 1, prvi fib broj
	movl $1  , %ecx #f2 = 1, drugi fib broj
	movl $0  , %edx #s = 0, suma
pocetak:
	cmpl $1  , %eax
	je   kraj       #zavrsava program ako je n == 1
	movl $0  , %edx #s = 0
	addl %ebx, %edx #s = s + f1
	addl %ecx, %edx #s = s + f2
zamena:
	movl %ecx, %ebx #f1 = f2
	movl %edx, %ecx #f2 = s
	decl %eax       #n--
	jmp  pocetak    #vraca se na pocetak
kraj:
	movl $1  , %eax
	movl $0  , %ebx
	int  $0x80