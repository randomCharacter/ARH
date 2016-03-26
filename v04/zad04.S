#v04/zad04
#proveriti da li je string palindrom ne obazirajuci se na specijalne karaktere
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
	.fill MAX
.section .text
.globl main
main: 
	leal str , %esi   #levi pokazivac za prolaz kroz string p
	movl %esi, %edi   #desni pokazivac za prolaz kroz string q
ispis:
	movl $4  , %eax
	movl $1  , %ebx
	movl $st1, %ecx
	movl $l1 , %edx
	int  $0x80        #ispisuje "UNESITE STRING:"
upis:
	movl $3  , %eax
	movl $0  , %ebx
	movl $str, %ecx
	movl $MAX, %edx
	int  $0x80        #ucitava string
	addl %eax, %edi
	decl %edi
upcase:               #PREBACUJE MALA SLOVA U VELIKA (v04/zad02)
	cmpb $'a', (%esi)
	jl   sledeci
	cmpb $'z', (%esi)
	jg   sledeci
povecanje:
	subl $32 , (%esi)
sledeci:
	incl %esi
	cmpl %edi, %esi
	jl   upcase
	leal str , %esi
karakteri:            #IZBACUJE KARAKTERE KOJI NISU SLOVA IZ STRINGA
	movl %esi, %ebx   #pomocni pokazivac r = p
	cmpb $'A', (%esi)
	jl   shift        #ako nije slovo shiftuje ostatak stringa
	cmpb $'Z', (%esi)
	jg   shift        #ako nije slovo shiftuje ostatak stringa
	jmp  dalje        #ako jeste prelazi na sledeci karakter
shift:
	movb 1(%ebx), %dl #t = *(p+1)
	movb %dl , (%ebx) #*p = t
	incl %ebx         #r++
	cmpl %edi, %ebx
	jle  shift        #ako nije dosao do kraja stringa nastavlja
	decl %eax         #smanjuje broj karaktera u stringu za 1 nakon izbacivanja
	jmp  karakteri    #ponavlja postupak
dalje:
	incl %esi         #p++
	cmpl $0, 1(%esi)
	jne  karakteri    #ponavlja postupak ako nije dosao do kraja
palindrom:            #PROVERAVA DA LI JE STRING PALINDROM (v04/zad03) ebx je 0 ako nije
	movl $1  , %ebx
	leal str , %esi
	movl %esi, %edi 
	addl %eax, %edi
	subl $2  , %edi
petlja:
	movb (%esi), %cl
	cmpb %cl, (%edi)
	jne  nije
	incl %esi
	decl %edi
	cmpl %esi, %edi
	jle  rez
	jmp  petlja
nije:
	movl $0  , %ebx
rez:
	movl %ebx, %esi
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