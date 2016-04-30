#t34/zad02
#potprogram koji broji elemnte 64bitnog niza koji su u intervalu
#autor: Mario Peric, E2
.section .data
gornja:
	.quad 123456789000
donja:
	.quad -123456789000
.section .text
.global DodajMnozi
#int DodajMnozi(long long *A, unsigned N)
DodajMnozi:
	pushl %ebp
	movl %esp, %ebp
	pushl %ebx
	pushl %esi
	pushl %edi

	movl 8(%ebp), %esi  #pokazivac na niz
	movl 12(%ebp), %ecx #broj elemenata u nizu
	movl $0  , %edi     #broj elemenata u opsegu

pocetak:
	movl (%esi), %ebx
	movl 4(%esi), %edx

donjaGranica:           #proverava da li se broj nalazi iznad donje granice
	cmpl donja+4, %edx
	jl   vanInt
	jg   gornjaGranica
	cmpl donja, %ebx
	jbe  vanInt

gornjaGranica:          #proverava da li se broj nalazi ispod gornje granice
	cmpl gornja+4, %edx
	jg   vanInt
	jl   uInt
	cmpl gornja, %ebx
	jae  vanInt

uInt:                   #povecava broj za 1000 ukoliko je u intervalu
	incl %edi
	addl $1000, (%esi)
	adcl $0  , 4(%esi)
	jmp  sledeci

vanInt:                 #mnozi broj sa 10 ukoliko je van intervala (proizvod.md)
	movl $10, %eax
	imul 4(%esi), %eax
	jo   greska
	movl %eax, 4(%esi)
	movl $10, %eax
	mull (%esi)
	addl %edx, 4(%esi)
	jo   greska
	movl %eax, (%esi)

sledeci:                #prelazak na sledeci element i uslov za kraj
	addl $8  , %esi
	decl %ecx
	cmpl $0  , %ecx
	jg   pocetak
	jmp  rez

greska:                 #vracanje -1 ako je doslo do prekoracenja
	movl $-1 , %eax
	jmp  kraj

rez:                    #vracanje broja elemenata ukoliko nije doslo do prekoracenja
	movl %edi, %eax

kraj_DodajMnozi:        #vracanje starih vrednosti u registre
	popl %edi
	popl %esi
	popl %ebx
	movl %ebp, %esp
	popl %ebp
	ret