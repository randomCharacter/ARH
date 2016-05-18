#v08/zad02
#potprogram koji konvertuje razlomljeni oktalni broj iz znakovnog oblika u interni
#autor: Mario Peric, E2
.section .text
.globl oct_str_float_to_inter
#unsigned int oct_str_float_to_inter(char* str, unsigned int* greska);
oct_str_float_to_inter:
	pushl %ebp
	movl %esp, %ebp
	pushl %ebx
	pushl %esi
	pushl %edi
	subl $4  , %esp                  #lokalna promenljiva
	movl $0, -4(%ebp)                #duzina stringa l
	movl $100000000, %ebx
	movl $0  , %edx
	movl $8  , %edi                  #baza
	movl $0  , %eax                  #rezultat
	movl 8(%ebp), %esi               #adresa stringa
kraj_str:                            #pomera esi na kraj stringa
	cmpb $0, (%esi)
	je   konverzija
	incl -4(%ebp)                    #l++
	incl %esi                        #prelaz na sledeci karakter
	jmp kraj_str
konverzija:
	decl %esi                        #prelazak na karakter pre '\0'
petlja:
	movl $0, %ecx
	movb (%esi), %cl                 #cifra u cl
	cmpb $'0', %cl
	jl   greska                      #nedozvoljen karakter
	cmpb $'7', %cl
	jg   greska                      #nedozvoljen karakter
	subb $'0', %cl                   #cifra u interni oblika
	imull %ebx, %ecx                 #rezultat * 10^8
	addl %ecx, %eax                  #dodavanje nove cifre na rezultat
	divl %edi                        #deljenje sa bazom
	decl %esi                        #prethodni karakter
	decl -4(%ebp)                    #broj preostalih karaktera--
	cmpl $0, -4(%ebp)                #nema vise karaktera?
	jne  petlja
bez_greske:
	movl 12(%ebp), %edi              #adresa greske
	movl $0, (%edi)
	jmp  kraj_oct_str_float_to_inter
greska:
	movl 12(%ebp), %edi              #adresa greske
	movl $1, (%edi)
kraj_oct_str_float_to_inter:
	popl %edi
	popl %esi
	popl %ebx
	movl %ebp, %esp
	popl %ebp
	ret