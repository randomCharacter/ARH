#v05/zad02
#potprogram koji racuna x-ti fibonacijev broj int fib(int x, int *res)
#vraca 0 ako je uspeo, 1 ako nije
#autor: Mario Peric, E2
.section .data
.section .text
.globl fib
#int fib(int x, int *x)
fib:
	pushl %ebp
	movl %esp, %ebp
	movl 8(%ebp), %eax #X -> eax
	movl $1, %ecx      #f1 = 1
	movl $1, %edx      #f2 = 1
petlja:                #v01/zad03
	cmpl $2  , %eax
	jle  rez
	addl %ecx, %edx
	jo   greska
	xchg %ecx, %edx
	decl %eax
	jmp  petlja
rez:
	movl 12(%ebp), %edx  #memorijska adresa res
	movl %ecx, (%edx)    #vracanje rezultata u *res
bez_greske:
	movl $0  , %eax
	jmp kraj_fib
greska:
	movl $1  , %eax
kraj_fib:
	movl %ebp, %esp
	popl %ebp
	ret