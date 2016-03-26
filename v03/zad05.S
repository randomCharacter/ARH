#v03/zad05
#izracunati elemente niza c kao zbir elemenata niza a i b (c[i] = a[i] + b[i]) u dvostrukoj preciznosti
#autor Mario Peric, E2
.section .data
NELEM = 10
a:
	.quad 1, 0, 3, 2, 9, 4, 5, 7, 6, 8
b:
	.quad 0, 1, 2, 3, 4, 9, 8, 7, 6, 5
c:
	.fill NELEM*8
gr:
	.long 0
.section .text
.globl main
main:
	movl $NELEM-1, %ecx      #index niza i
	movl $0  , %eax         #vise znacajne cifre zbira
	movl $0  , %ebx         #manje znacajne cifre zbira
pocetak:
	movl a+4(,%ecx,8), %eax #a[i]->eax (vise znacajne cifre)
	movl a  (,%ecx,8), %ebx #a[i]->ebx (manje znacajne cifre)
	addl b+4(,%ecx,8), %eax #eax+=b[i] (vise znacajne cifre)
	adcl b  (,%ecx,8), %ebx #eax+=b[i] (manje znacajne cifre)
	adcl $0  , gr
greska:
	cmpl $0  , gr
	jne kraj                #ne upisuje rezultat ako je doslo do greske
rezultat:
	movl %eax, c+4(,%ecx,8) #eax->c[i] (vise znacajne cifre)
	movl %ebx, c  (,%ecx,8) #eax->c[i] (manje znacajne cifre)
	decl %ecx
	cmpl $0  , %ecx
	jge  pocetak            #ponavlja postupak dok je i >= 0
kraj:
	movl $1  , %eax
	movl $0  , %ebx
	int  $0x80