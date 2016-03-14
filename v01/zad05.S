#v01/zad05
#deljenje oduzimanjem
#autor: Mario Peric, E2
.section .data
.section .text
.globl main
main:
	movl $10 , %eax #n = 10, prvi broj
	movl $3  , %ebx #m = 3, drugi broj
	movl $0  , %ecx #k = 0, kolicnik
	movl $0  , %edx #o = 0, ostatak
pocetak:
	cmpl %eax, %ebx 
	ja   ostatak    #ako je n < m doslo je do kraja
oduzimanje:
	subl %ebx, %eax #n -= m
	incl %ecx       #k++, kolicnik se povecava
	jmp pocetak     #postupak se nastavlja
ostatak:
	movl %eax, %edx #pre zavrsetka prebacuje ostatak u edx
kraj:
	movl $1  , %eax
	movl $0  , %ebx
	int  $0x80