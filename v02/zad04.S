#v02/zad04
#izracunati n-ti fibonacijev broj u dvostrukoj preciznosti
#autor: Mario Peric, E2
.section .data
N:
	.quad 5
F:
	.quad 0
gr:
	.long 0
.section .text
.globl main
main:
	movl N   , %edi #manje znacajne cifre N
	movl N+4 , %esi #vise znacajne cifre N
	movl $1  , %ebx #manje znacajne cifre prvog fib broja
	movl $0  , %eax #vise znacajne cifre prvog fib broja
	movl $1  , %edx #manje znacajne cifre drugog fib broja
	movl $0  , %ecx #vise znacajne cifre drugog fib broja
pocetak:
	addl %eax, %ecx
	adcl %ebx, %edx
	adcl $0  , gr
	xchgl %eax, %ecx
	xchgl %ebx, %edx
	subl $1  , %edi
	sbbl $0  , %esi
uporedi:
	cmpl $0  ,%esi
	jne  pocetak
	cmpl $1  ,%edi
	jne pocetak
greska:
	cmpl $0  , gr
	jne kraj        #ne upisuje rezultat ako je doslo do greske
rezultat:
	movl %ecx, F+4
	movl %edx, F
kraj:
	movl $1  , %eax
	movl $0  , %ebx
	int  $0x80