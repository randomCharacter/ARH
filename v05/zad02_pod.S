#v05/zad02
#potprogram koji racuna N ti fibonacijev broj int fib(int x)
#autor: Mario Peric, E2
.section .data
.section .text
.globl fib
#int fib(int x)
fib:
	pushl %ebp
	movl %esp, %ebp
	movl 8(%ebp), %eax #X -> eax
	movl $1, %ecx      #f1 = 1
	movl $1, %edx      #f2 = 1
petlja:
	cmpl $2  , %eax
	jle  rez
	addl %ecx, %edx
	xchg %ecx, %edx
	decl %eax
	jmp  petlja
rez:
	movl %ecx, %eax
kraj_fib:
	movl %ebp, %esp
	popl %ebp
	ret