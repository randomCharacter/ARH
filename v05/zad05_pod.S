 #v05/zad05
 #potprogram koji racuna n-ti fibonacijev broj rekurzivno
 #autor: Mario Peric, E2
.section .data
.section .text
.globl fib
 #int fib(int x)
fib:
	pushl %ebp
	movl %esp, %ebp
	movl 8(%ebp), %ecx   #X -> ecx
	movl $0  , %edx      #rezultat
	subl $4  , %esp      #lokalna promenljiva za rezultat
	movl $0, -4(%ebp)    #res = 0
pocetak:                 #trivijalni slucajevi
	cmpl $2  , %ecx
	jle  trivijalno
poziv1:                  #poziv za X-1
	decl %ecx
	pushl %ecx
	call fib
	popl %ecx
	addl %eax, -4(%ebp)  #dodavanje na rezultat
poziv2:                  #poziv za X-2
	decl %ecx
	pushl %ecx
	call fib
	popl %ecx
	addl %eax, -4(%ebp)  #dodavanje na rezultat
	jmp  rez
trivijalno:
	movl $1, -4(%ebp)
rez:
	movl -4(%ebp), %eax
kraj_fib:
	movl %ebp, %esp     #brisanje lokalnig promenljivih
	popl %ebp
	ret