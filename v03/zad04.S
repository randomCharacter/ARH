#v04/zad04
#sortirati string po abecedi
#autor: Mario Peric, E2
.section .data
string:
	.ascii "Sortiraj me"
.section .text
.globl main
main:
	leal string, %esi #pokazivac na pocetak stringa
	leal string, %edi   #pokazivac na kraj stringa
	movl $0  , %edx   #duzina stringa len = 0
	movl $0  , %ebx   #adresa max karaktera
duzina:
	cmpl $0  , (%esi)
	je   duz_adr
	incl %esi
	jmp  duzina
duz_adr:
	movl %esi, %edi
	decl %edi
pocetak:
	leal string, %esi
	movl $string, %ebx   #n = 0
	movb (%esi), %cl  #max = niz[0]
max:
	movb (%esi), %ch
	cmpb (%esi), %cl
	jnl  sled
	movb (%esi), %cl
	movl %esi, %ebx
sled:
	incl %esi
	cmpl %esi, %edi
	jge  max
promena:
	movb (%ebx), %ch
	xchg (%edi), %ch
	movb %ch, (%ebx)
	decl %edi
	cmpl $string, %edi
	jge  pocetak
kraj:
	movl $1  , %eax
	movl $0  , %ebx
	int  $0x80