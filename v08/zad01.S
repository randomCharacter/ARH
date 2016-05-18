#v08/zad01
#potprogram koji konvertuje neoznacen broj iz oktalnog u interni oblik
#autor: Mario Peric, E2
.section .text
.globl oct_str_to_inter
#unsigned int oct_str_to_inter(char* str, unsigned int* greska);
oct_str_to_inter:
	pushl %ebp
	movl %esp, %ebp
	pushl %ebx
	pushl %esi
	pushl %edi
	movl 8(%ebp), %esi     #adresa stringa
	movl $0  , %eax        #rezultat
	movl $8  , %ebx        #baza sistema
	cmpl $0, (%esi)        #prazan string?
	movl 12(%ebp), %edi    #adresa greske
	movl $0, (%edi)        #pretpostavka da nema greske
	je   greska
konverzija:
	cmpb $0, (%esi)        #kraj stringa?
	je   kraj_oct_to_inter
	movl $0  , %ecx        #zbog cl
	movb (%esi), %cl
	cmpb $'0', %cl
	jl   greska            #nedozvoljen karakter
	cmpb $'7', %cl
	jg   greska            #nedozvoljen karakter
	subb $'0', %cl         #cifra u interni oblik
	mull %ebx              #stari rezultat * baza
	cmpl $0  , %edx
	jne  greska            #prekoracenje
	addl %ecx, %eax        #nova cifra na kraj rezultata
	jo   greska            #prekoracenje
	incl %esi              #sledeci karakter
	jmp  konverzija
greska:
	movl $1, (%edi)        #neuspesna konverzija
kraj_oct_to_inter:
	popl %edi
	popl %esi
	popl %ebx
	movl %ebp, %esp
	popl %ebp
	ret