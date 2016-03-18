#v02/zad06
#izracunati c = 2a + b/3 u dvostrukoj preciznosti
#autor: Mario Peric, E2
.section .data
a:
	.quad 5
b:
	.quad 9
c:
	.quad 0
gr:
	.long 0
.section .text
.globl main
main:
	movl a+4 , %eax #vise znacajne cifre broja a
	movl a   , %ebx #manje znacajne cifre broja a
	movl b+4 , %ecx #vise znacajne cifre broja b
	movl b   , %edx #manje znacajne cifre broja b
	movl $0  , %esi #vise znacajne cifre kolicnika t = b/3
	movl $0  , %edi #manje znacajne cifre kolicnika t = b/3
prvi:
	addl %ebx, %ebx #a = a + a
	adcl %eax, %eax #a = a + a
	adcl $0  , gr   #proverava da li dolazi do prelaza
drugi:
	cmpl $0  ,%ecx  #proverava da li je t > 3 (vise znacajne cifre)
	jl   zbir       #zavrsava postupak ako jeste
	cmpl $3  , %edx #proverava da li je t > 3 (manje znacajne cifre)
	jl   zbir       #zavrsava postupak ako jeste
	subl $3  , %edx #oduzima 3 od b (manje znacajne cifre)
	sbbl $0  , %ecx #oduzima 3 od b (vise znacajne cifre)
	addl $1  , %edi #povecava kolicnik za 1 (manje znacajne cifre)
	adcl $0  , %edi #povecava kolicnik za 1 (vise znacajne cifre)
	jmp  drugi      #ponavlja postupak
zbir:
	addl %edi, %ebx #a += t (manje znacajne cifre)
	adcl %esi, %eax #a += t (vise znacajne cifre)
	adcl $0  , gr   #proverava da li dolazi do prelaza
greska:
	cmpl $0  , gr
	jne kraj        #ne upisuje rezultat ako je doslo do greske
rezultat:
	movl %eax, c+4  #vraca vise znacajne cifre u c
	movl %ebx, c    #vraca manje znacajne cifre u c
kraj:
	movl $1  , %eax
	movl $0  , %ebx
	int  $0x80