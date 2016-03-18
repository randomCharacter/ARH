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
	movl $1  , %ebx #manje znacajne cifre prvog fib broja F1
	movl $0  , %eax #vise znacajne cifre prvog fib broja F1
	movl $1  , %edx #manje znacajne cifre drugog fib broja F2
	movl $0  , %ecx #vise znacajne cifre drugog fib broja F2
pocetak:
	addl %ebx, %edx #F2 += F1 (manje znacajne cifre)
	adcl %eax, %ecx #F2 += F1 (vise znacajne cifre)
	adcl $0  , gr   #proverava da li je doslo do prekoracenja
	xchgl %eax, %ecx#F2 <-> F1 (vise znacajne cifre)
	xchgl %ebx, %edx#F2 <-> F1 (manje znacajne cifre)
	subl $1  , %edi #N-- (manje znacajne cifre)
	sbbl $0  , %esi #N-- (vise znacajne cifre)
uporedi:
	cmpl $0  ,%esi
	jne  pocetak    #ako je N > 1 ponavlja postupak
	cmpl $1  ,%edi
	jne pocetak     #ako je N > 1 ponavlja postupak
greska:
	cmpl $0  , gr
	jne kraj        #ne upisuje rezultat ako je doslo do greske
rezultat:
	movl %ecx, F+4  #vraca vise znacajne cifre u F
	movl %edx, F    #vraca manje znacajne cifre u F
kraj:
	movl $1  , %eax
	movl $0  , %ebx
	int  $0x80