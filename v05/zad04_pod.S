#v05/zad04
#potprogram koji racuna zbir nizova a i b i smesta ga u c
#autor: Mario Peric, E2
.section .data
.section .text
.globl saberi_niz
saberi_niz:
#int saberi_niz(long long *a, long long *b, long long *c, int n)
	pushl %ebp
	pushl %ebx
	pushl %esi
	pushl %edi
	movl %esp, %ebp
	movl 20(%ebp), %eax       #a -> eax
	movl 24(%ebp), %ebx       #b -> ebx
	movl 28(%ebp), %ecx       #c -> ecx
	movl 32(%ebp), %edx       #n -> edx
petlja:
	movl (%eax,%edx,8), %esi
	movl 4(%eax,%edx,8), %edi
	addl (%ebx,%edx,8), %esi
	adcl 4(%ebx,%edx,8), %edi
	jo   greska               #greska ako je doslo do prekoracenja
	movl %esi, (%ecx,%edx,8)  #vracanje rezultata
	movl %edi, 4(%ecx,%edx,8)
	decl %edx                 #n--
	cmpl $0  , %edx
	jge  petlja
	jmp  nije_greska
greska:
	movl $1  , %eax
	jmp kraj_saberi_niz
nije_greska:
	movl $0  , %eax
	jmp kraj_saberi_niz
kraj_saberi_niz:
	movl %ebp, %esp           #brisanje lokalnig promenljivih
	popl %edi                 #vracanje zatecenih vrednosti u registrima
	popl %esi
	popl %ebx
	popl %ebp
	ret