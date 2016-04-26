#t12/zad01
#naci sve karaktere koji nisu ni slovo ni cifra i izbaciti ih
#autor: Mario Peric, E2
.section .data
MAX = 100
str1:
	.fill 100
str2:
	.ascii "Unesite string: "
l2 = . - str2
str3:
	.ascii "Ispravljeni string je: "
l3 = . - str3
non_aplanum:
	.long 0
.section .text
.globl main
main:
	leal str1, %esi      #pokazivac na string
	movl $0  , %edi      #duzina stringa
	movl $0, non_aplanum
ucitavanje:
	movl $4  , %eax
	movl $1  , %ebx
	movl $str2, %ecx
	movl $l2 , %edx
	int  $0x80            #ispis poruke "Unesite string:"
	movl $3  , %eax
	movl $0  , %ebx
	movl $str1, %ecx
	movl $MAX, %edx
	int  $0x80            #ucitavanje stringa
	movl %eax, %edi       #smestanje duzine stringa u %edi
	decl %eax
pocetak:
	movb (%esi), %dl
mal_sl:                   #proverava da li je karakter malo slovo
	cmpb $'a', %dl
	jl   vel_sl
	cmpb $'z', %dl
	jl   sled
vel_sl:                   #proverava da li je karakter veliko slovo
	cmpb $'A', %dl
	jl   broj
	cmpb $'Z', %dl
	jl   sled
broj:                     #proverava da li je karakter cifra
	cmpb $'0', %dl
	jl   zameni
	cmpb $'9', %dl
	jl sled
zameni:                   #menja karakter na '0' ako nije nista od prethodnog
	incl non_aplanum
	movb $'0', (%esi)
sled:                     #prelaz na sledeci karakter ukoliko nije kraj stringa
	incl %esi
	decl %eax
	cmpl $0  , %eax
	jne  pocetak
ispis:
	movl $4  , %eax
	movl $1  , %ebx
	movl $str3, %ecx
	movl $l3, %edx
	int  $0x80            #ispis poruke Ispravljeni string je:"

	movl $4  , %eax
	movl $1  , %ebx
	movl $str1, %ecx
	movl %edi, %edx
	int  $0x80            #ispis novokreiranog stringa
kraj:
	movl $1, %eax
	movl non_aplanum, %ebx
	int  $0x80