#v02/zad02
#podelti broj A sa brojem B i kolicnik snimiti u K, a ostatak u O
#autor: Mario Peric, E2
.section .data
A: 
	.long 17
B:
	.long 3
K:
	.long 0
O: 
	.long 0
.section .text
.globl main
main:
	movl A   , %eax #prebacuje A broj u eax
	movl B   , %ebx #prebacuje B broj u ebx
	movl $0  , %ecx #K = 0, kolicnik
pocetak:
	subl %ebx, %eax #B -= A
 	incl %ecx       #K++
	cmpl %eax, %ebx #ako je A > B
	jl   pocetak    #ponavlja postupak
rezultat:
	movl %ecx, K    #prebacuje K iz registra u memoriju
	movl %eax, O    #prebacuje O iz registra u memoriju
kraj:
	movl $1  , %eax
	movl $0  , %ebx
	int  $0x80