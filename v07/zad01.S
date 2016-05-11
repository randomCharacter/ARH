#v07/zad01
#potprogram koji konvertuje neoznacen broj iz internog oblika u string u oktalnom obliku
#autor: Mario Peric, E2
.section .text 
.globl inter_to_oct_str
#unsigned int inter_to_oct_str(unsigned int broj, char* str, unsigned int duzina)
inter_to_oct_str:
	pushl %ebp
	movl %esp, %ebp
	pushl %ebx
	pushl %esi
	pushl %edi
	movl $0  , %edi     #trenutna duzina stringa 
	movl 8(%ebp), %eax  #broj za konverziju
	movl 12(%ebp), %esi #pokazivac na string
	movl 16(%ebp), %ecx #max duzina stringa
	decl %ecx           #zbog '\0' na kraju
	movl $8  , %ebx     #baza sistema
konverzija:
	movl $0,  %edx      #zbog deljenja
	cmpl $0,  %ecx      #string je predugacak
	jl greska
	decl %ecx           #smanjuje broj preostalih dozvoljenih karaktera
	cmpl $0  , %eax     #kraj konverzije
	je kraj_konverzije
	divl %ebx           #uzimanje poslednje cifre
	addb $'0', %dl      #pretvaranje u znakovni oblik
	movb %dl, (%esi)    #prebacivanje u string
	incl %esi           #prelazak na sledeci karakter
	incl %edi           #duzina stringa++
	jmp konverzija
kraj_konverzije:	
	movb $0, (%esi)     #'\0' na kraj stringa
	decl %esi           #desni element = pokazivac na poslednji karakter stringa
	movl 12(%ebp), %edi #levi element = pokazivac na prvi karakter stringa
obrni:                  #obrce redosled u stringu
	cmpl %edi, %esi     #ako su se esi i edi mimoisli
	jbe kraj            #ide na kraj
	movb (%esi), %ah    #esi i edi menjaju mesta
	movb (%edi), %al
	movb %al, (%esi)
	movb %ah, (%edi)
	incl %edi           #pomera levi u desno
	decl %esi           #pomera desni u levo
	jmp obrni
greska:
	movl $1  , %eax
	jmp kraj_inter_to_oct_str
kraj:
	movl $0  , %eax
kraj_inter_to_oct_str:
	popl %edi
	popl %esi
	popl %ebx
	movl %ebp, %esp
	popl %ebp
	ret