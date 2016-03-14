#v02/zad03
#pomnoziti  brojeve A i B u dvostrukoj preciznosti i rezultat smestiti u P
#autor: Mario Peric, E2
.section .data
A: 
	.quad 1000000000
B: 
	.quad 2
P: 
	.quad 0
gr:
	.long 0
.section .text
.globl main
main:
	movl A   , %ebx #prebacuje manje znacajne cifre iz A u ebx
	movl A+4 , %eax #prebacuje vise znacajne cifre iz A u eax
	movl B   , %edx #prebacuje manje znacajne cifre iz B u edx
	movl B+4 , %ecx #prebacuje vise znacajne cifre iz B u ecx
	movl $0  , %edi #vise znacajne cifre P
	movl $0  , %esi #manje znacajne cifre P
pocetak:
	addl %ebx, %esi #sabira manje znacajne cifre
	adcl %eax, %edi #sabira vise znacajne cifre sa prenosom
	adcl $0  , gr   #proverava da li dolazi do prelaza
	subl $1  , %edx #smanjuje manje znacajne cifre B za 1
	sbbl $0  , %ecx #smanjuje vise znacajne cifre ako je doslo do prekoracenja
uporedi:
	cmpl $0  , %ecx #poredi vise znacajne cifre
	jne  pocetak    #ponavlja postupak ako nisu 0
	cmpl $0  , %edx #poredi manje znacajne cifre
	jne  pocetak    #ponavlja postupak ako nisu 0
greska:
	cmpl $0  , gr
	jne kraj        #ne upisuje rezultat ako je doslo do greske
rezultat:
	movl %edi, P+4  #vraca vise znacajne cifre u P
	movl %esi, P    #vraca manje znacajne cifre u P
kraj:
	movl $1  , %eax
	movl $0  , %ebx
	int  $0x80