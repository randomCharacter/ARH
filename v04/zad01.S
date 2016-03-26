#v04/zad01
#za uneto ime i prezime ispisati ga
#autor: Mario Peric, E2
.section .data
st1:
	.ascii "UNESITE IME I PREZIME:\0"
l1 = . - st1
st2:
	.ascii "VI STE:\0"
l2 = . - st2
MAX = 20
st3:
	.fill MAX
.section .text
.globl main
main:
ispis1:
	movl $4  , %eax #ispis
	movl $1  , %ebx #stdout
	movl $st1, %ecx #string za ispis
	movl $l1 , %edx #duzina stringa
	int  $0x80      #ispisuje "UNESITE IME I PREZIME:"
upis:
	movl $3  , %eax #ucitavanje
	movl $0  , %ebx #stdin
	movl $st3, %ecx #string u koji se smesta rezultat
	movl $MAX, %edx #maksimalna duzina stringa
	int  $0x80      #ucitava u string st3
ispis2:
	movl $4  , %eax
	movl $1  , %ebx
	movl $st2, %ecx
	movl $l2 , %edx
	int  $0x80      #ispisuje "VI STE:"
ispis3:
	movl $4  , %eax
	movl $1  , %ebx
	movl $st3, %ecx
	movl $MAX, %edx
	int  $0x80      #ispisuje uneti string st3
kraj:
	movl $1  , %eax
	movl $0  , %ebx
	int  $0x80