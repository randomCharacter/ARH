#v02/zad05
#izracunati faktorijel broja n u dvostrukoj preciznosti
#autor: Mario Peric, E2
.section .data
N:
	.quad 10
F:
	.quad 0
gr:
	.long 0
.section .text
.globl main
main:
	movl N+4 , %eax #vise znacajne cifre N
	movl N   , %ebx #manje znacajne cifre N
	movl $0  , %ecx #vise znacajne cifre faktorijela
	movl $1  , %edx #manje znacajne cifre faktorijela
	movl $0  , %esi #vise znacajne cifre proizvoda P 
	movl $0  , %edi #manje znacajne cifre proizvoda P
	movl $0  , %esp #vise znacajne cifre pom. prom. T
	movl $0  , %ebp #manje znacajne cifre pom. prom. T
pocetak:
	movl $0  , %esi #P = 0 (manje znacajne cifre)
	movl $0  , %edi #P = 0 (vise znacajne cifre)
	movl %eax, %esp #T = N (manje znacajne cifre)
	movl %ebx, %ebp #T = N (vise znacajne cifre)
mnozenje:
	addl %edx, %edi #P += F (manje znacajne cifre)
	adcl %ecx, %esi #P += F (vise znacajne cifre)
	adcl $0  , gr   #proverava da li je doslo do prelaza
	subl $1  , %ebp #T-- (manje znacajne cifre)
	sbbl $0  , %esp #T-- (vise znacajne cifre)
	cmpl $0  , %esp 
	jg   mnozenje   #nastavlja mnozenje ako je T > 0
	cmpl $0  ,%ebp
	jg   mnozenje   #nastavlja mnozenje ako je T > 0
faktorijel:
	movl %edi, %edx #F += P (manje znacajne cifre)
	movl %esi, %eax #F += P (vise znacajne cifre)
	subl $1  , %ebx #T-- (manje znacajne cifre)
	sbbl $0  , %eax #T-- (vise znacajne cifre)
	cmpl $0  , %ebx 
	jge  pocetak    #ponavlja postupak ako je N > 0
	cmpl $0  , %eax
	jge  pocetak    #ponavlja postupak ako je N > 0
greska:
	cmpl $0  , gr
	jne kraj        #ne upisuje rezultat ako je doslo do greske
rezultat:
	movl %ecx, F+4  #vraca vise znacajne cifre u F
	movl %edx, F    #vraca vise znacajne cifre u F
kraj:
	movl $1  , %eax
	movl $0  , %ebx
	int  $0x80