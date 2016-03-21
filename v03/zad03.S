#v03/zad03
#izbaciti razmake na pocetku i kraju stringa
#autor: Mario Peric, E2
.section .data
string: 
	.ascii "  MR. ROBOT    \0"
.section .text
.globl main
main:
	leal string, %eax          #pokazivac na pocetak niza *p = $string
	movl $0  , %ebx            #brojac i = 0
pocetak:
	cmpb $' ', (%eax)          #
	jne  poc_raz               #ako nema vise razmaka nastavlja dalje
	incl %eax                  #p++ (prelaz na sledeci karakter)
	decl %ebx                  #i--
	jmp  pocetak               #vraca se na pocetak
poc_raz:
	movb (%eax), %cl           #t = *p
	movb %cl , (%eax, %ebx, 1) #*(p+i) = t
	incl %eax                  #p++
	cmpb $0  , -1(%eax)
	jne  poc_raz               #ako nije kraj string ponavlja se
vrati:
	leal string, %eax          #vraca p na pocetak stringa
kraj_s:
	cmpb $0  , (%eax)
	je   kraj_raz              #nastavlja dalje ako je kraj stringa
	incl %eax                  #p++
	jmp  kraj_s                #ponavlja dok ne dodje do kraja
kraj_raz:
	cmpb $' ', -1(%eax)
	jne  izbaci                #ako prethodni element nije razmak
	decl %eax                  #p--
	jmp  kraj_raz
izbaci:
	movb $0  ,(%eax)           #stavlja \0 na posle poslednjeg karaktera koji nije razmak
kraj:
	movl $1  , %eax
	movl $0  , %ebx
	int  $0x80