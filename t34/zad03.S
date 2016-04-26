#t34/zad03
#potprogram koji izbacuje specijahne karaktere iz stringa
#autor: Mario Peric, E2
.section .data
.section .text
.global Izbaci
#int Izbaci(char *s)
Izbaci:
	pushl %ebp
	movl %esp, %ebp

	movl 8(%esp), %ecx #pokazivac na string
	movl $0  , %eax    #rezultat

provera:               #ako je tekuci karakter nedozvoljen znak izbacuje ga
	cmpb $'!' , (%ecx)
	je   izbaci
	cmpb $'#' , (%ecx)
	je   izbaci
	cmpb $'$' , (%ecx)
	je   izbaci
	cmpb $'%' , (%ecx)
	je   izbaci
	cmpb $'&' , (%ecx)
	je   izbaci
	cmpb $' ' , (%ecx)
	je   izbaci
	cmpb $'/' , (%ecx)
	je   izbaci
	cmpb $'*' , (%ecx)
	je   izbaci
	jmp  sledeci

sledeci:               #prelazak na sledeci znak
	incl %ecx
	cmpb $0  , (%ecx)
	jnz  provera
	jmp  kraj_Izbaci

izbaci:                #izbacuje znak siftovanjem ulevo
	movl $1  , %eax    #ubacuje 1 u eax kao znak da se nesto desilo
	movl %ecx, %edx
petlja:
	movb 1(%edx), %ah
	movb %ah  ,(%edx)
	movb $0  , %ah     #vracanje ah na inicijalnu vrednost (kako se rezultat ne bi poremetio)
	incl %edx
	cmpb $0  , (%edx)
	jnz  petlja
	jmp  provera

kraj_Izbaci:
	movl %ebp, %esp
	popl %ebp
	ret