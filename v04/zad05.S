.section .data
EL = 10
MAX = 20
str:
	.fill 10 * 20
.section .text
.globl main
main:
	movl $EL  , %edi #brojac za prolaz kroz stringove i
	movl $str , %esi #adresa na koju treba upisati
upis:
	movl $3  , %eax
	movl $0  , %ebx
	movl %esi, %ecx
	movl $MAX, %edx
	int  $0x80      #ucitava string
	addl $20 , %esi #pomera memoriju za upis za 20 bajta udesno
	decl %edi       #i--
	cmpl $0, %edi
	jne  upis       #ako nije poslednji nastavlja sa ucitavanjem
	movl $EL , %edi #resetuje pokazivac
	subl $20 , %esi #postavlja adresu na poslednje mesto
ispis:
	movl $4  , %eax
	movl $1  , %ebx
	movl %esi, %ecx
	movl $MAX, %edx
	int  $0x80      #ispisuje string
	subl $20 , %esi #pomera memoriju za 20 bajta ulevo
	decl %edi       #i--
	cmpl $0, %edi
	jne  ispis      #ako nije poslednji nastavlja ispis
kraj:
	movl $1  , %eax
	movl $0  , %ebx
	int  $0x80