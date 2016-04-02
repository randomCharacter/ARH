#naci sve karaktere koji nisu ni slovo ni cifra i izbaciti ih
#t12/zad01
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
	leal str1, %esi
	movl $0, non_aplanum
ucitavanje:
	movl $4  , %eax
	movl $1  , %ebx
	movl $str2, %ecx
	movl $l2 , %edx
	int  $0x80       #ispis poruke
	movl $3  , %eax
	movl $0  , %ebx
	movl $str1, %ecx
	movl $MAX, %edx
	int  $0x80
	movl %eax, %edi
	decl %eax
pocetak:
	movb (%esi), %dl
mal_sl:
	cmpb $'a', %dl
	jl   vel_sl
	cmpb $'z', %dl
	jl   sled
vel_sl:
	cmpb $'A', %dl
	jl   broj
	cmpb $'Z', %dl
	jl   sled
broj:
	cmpb $'0', %dl
	jl   zameni
	cmpb $'9', %dl
	jl sled
zameni:
	incl non_aplanum
	movb $'0', (%esi)
sled:
	incl %esi
	decl %eax
	cmpl $0  , %eax
	jne  pocetak
ispis:
	movl $4  , %eax
	movl $1  , %ebx
	movl $str3, %ecx
	movl $l3, %edx
	int  $0x80

	movl $4  , %eax
	movl $1  , %ebx
	movl $str1, %ecx
	movl %edi, %edx
	int  $0x80
kraj:
	movl $1, %eax
	movl non_aplanum, %ebx
	int  $0x80