#v04/zad02
#ucitati ime i prezime, a zatim ga ispisati (UPCASE)
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
	leal st3 , %esi   #pokazivac za prolaz kroz string p
	movl $0  , %edi   #pokazivac na kraj stringa q
ispis1:
	movl $4  , %eax
	movl $1  , %ebx
	movl $st1, %ecx
	movl $l1 , %edx
	int  $0x80        #ispisuje "UNESITE IME I PREZIME:"
upis:
	movl $3  , %eax
	movl $0  , %ebx
	movl $st3, %ecx
	movl $MAX, %edx
	int  $0x80        #ucitava u string st3
poslednji:
	movl %esi, %edi
	addl %eax, %edi   #dodaje duzinu stringa u edi
upcase:
	cmpb $'a', (%esi)
	jl   sledeci      #ako je karakter manji od 'a' ne menja ga
	cmpb $'z', (%edi)
	jg   sledeci      #ako je karakter veci od 'z' ne menja ga
povecanje:
	subl $32 , (%esi) #pretvara mali karakter u veliki
sledeci:
	incl %esi         #i++
	cmpl %edi, %esi
	jl   upcase       #ako je p > q ispada
ispis2:
	movl $4  , %eax
	movl $1  , %ebx
	movl $st2, %ecx
	movl $l2 , %edx
	int  $0x80        #ispisuje "VI STE:"
ispis3:
	movl $4  , %eax
	movl $1  , %ebx
	movl $st3, %ecx
	movl $MAX, %edx
	int  $0x80        #ispisuje uneti string st3 povecan
kraj:
	movl $1  , %eax
	movl $0  , %ebx
	int  $0x80