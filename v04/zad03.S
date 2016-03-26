#v04/zad03
#proveriti da li je string palindrom
#autor: Mario Peric, E2
.section .data
st1:
	.ascii "UNESITE STRING:\0"
l1 = . - st1
st2:
	.ascii "STRING "
l2 = . - st2
st3:
	.ascii "JE PALINDROM\n"
l3 = . - st3
st4:
	.ascii "NI"
l4 = . - st4
MAX = 20
str:
	.fill MAX,1,'#'
.section .text
.globl main
main: 
	leal str, %esi   #levi pokazivac za prolaz kroz string p
	movl $0 , %edi   #desni pokazivac za prolaz kroz string q
ispis:
	movl $4  , %eax
	movl $1  , %ebx
	movl $st1, %ecx
	movl $l1 , %edx
	int  $0x80       #ispisuje "UNESITE STRING:"
upis:
	movl $3  , %eax
	movl $0  , %ebx
	movl $str, %ecx
	movl $MAX, %edx
	int  $0x80       #ucitava string
palindrom:
	movl $1  , %ebx  #1 ako je palindrom
	movl %esi, %edi 
	addl %eax, %edi
	subl $2  , %edi  #q pokazuje na poslednji karakter stringa
petlja:
	movb (%esi), %cl
	cmpb %cl, (%edi) #poredi levi i desni pokazivac
	jne  nije        #nije palindrom ako su razliciti
	incl %esi        #pomera p za jedno mesto udesno
	decl %edi        #pomera q za jedno desno ulevo
	cmpl %esi, %edi
	jle  rez         #zavrsava ako se p i q sretnu
	jmp  petlja      #vraca se na poctak inace
nije:
	movl $0  , %ebx  #string nije palindrom
rez:
	movl %ebx, %esi  #ebx se koristi za sistemske pozive
ispis1:
	movl $4  , %eax
	movl $1  , %ebx
	movl $st2, %ecx
	movl $l2 , %edx
	int  $0x80       #ispisuje "STRING "
upit:
	cmpl $1, %esi
	je   ispis3      #preskace sledeci ispis ako string jeste palindrom
ispis2:
	movl $4  , %eax
	movl $1  , %ebx
	movl $st4, %ecx
	movl $l4 , %edx
	int  $0x80       #ispisuje "NI"
ispis3:
	movl $4  , %eax
	movl $1  , %ebx
	movl $st3, %ecx
	movl $l3 , %edx
	int  $0x80       #ispisuje "JE PALINDROM"
kraj:
	movl $1  , %eax
	movl $0  , %ebx
	int  $0x80