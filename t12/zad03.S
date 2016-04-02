#izracunati elemente niza C po formuli C[i]=A[i]-B[i] za A[i]>B[i], C[i]=A[i]+B[i] inace
#t12/zad03
#autor: Mario Peric, E2
.section .data
NELEM = 4
A:
	.quad 5000000001, 5, 3, 6000000005
B:
	.quad 5000000000, 4, 7, 32000
C:
	.quad 0, 0, 0, 0
greska:
	.long 0
.section .text
.globl main
main:
	movl $0  , %esi         #index i
	movl $0  , greska
pocetak:                    #uporedjivanje nizova A i B
	movl A+4(,%esi,8), %eax
	cmpl B+4(,%esi,8), %eax
	jl   zbir
	jg   raz
	movl A(,%esi,8), %eax
	cmpl B(,%esi,8), %eax
	jl   zbir
raz:                        #racunanje razlike A i B ako je A>B
	movl A+4(,%esi,8), %eax
	movl A(,%esi,8), %ebx
	subl B+4(,%esi,8), %eax 
	sbbl B(,%esi,8), %ebx
	jmp  sled
zbir:                       #racunanje zbira A i B ako nije A>B
	movl A+4(,%esi,8), %eax
	movl A(,%esi,8), %ebx
	addl B+4(,%esi,8), %eax
	adcl B(,%esi,8), %ebx
	adcl $0, greska
	jnz  kraj
sled:                       #prelazak na sledece elemente niza
	movl %eax, C+4(,%esi,8)
	movl %ebx, C(,%esi,8)
	incl %esi
	cmpl $NELEM, %esi
	jl  pocetak
kraj:
	movl $1  , %eax
	movl greska, %ebx
	int  $0x80