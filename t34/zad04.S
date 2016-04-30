#t34/zad04
#potprogram koji broji 16bitne brojeve koji imaju paran broj jedinica
#autor: Mario Peric, E2
.section .data
.section .text
.globl RazmeniBit
#int RazmeniBit(unsigned short *A, unsigned N)
RazmeniBit:
	pushl %ebp
	movl %esp, %ebp
	pushl %ebx
	pushl %esi
	pushl %edi

	movl 8(%ebp), %esi  #pokazivac na niz
	movl 12(%ebp), %ecx #broj elemenata niza
	movl $0  , %eax     #brojac elemenata sa parnim brojem nula

pocetak:
	movw (%esi), %dx
	movw $0  , %bx      #broj jedinica

petlja:                 #prebrojava koliko broj ima jedinica u bin. obliku
	shlw $1  , %dx
	adcw $0  , %bx
	cmpw $0  , %dx
	jne  petlja

broj:                   #proverava da li je broj jedinica paran ili neparan
	movw (%esi), %dx
	shrw %bx
	jc   neparan        #ako je poslednja cifra 1 u binarnom obliku broj nije paran

paran:                  #menja poslednje i prve tri cifre u bin. obliku
	incl %eax           #povecava brojac za 1
#prva maska
	movw %dx, %bx
	andw $0x0007, %bx   #0x0007 = 0b0000000000000111
	rorw $3 , %bx
#druga maska
	movw %dx, %di
	andw $0xE000, %di   #0xE000 = 0b1110000000000000
	rolw $3 , %di
	orw  %di, %bx
#treca maska
	andw $0x1FF8, %dx   #0x1FF8 = 0b0001111111111000
	orw  %bx, %dx
#vraca rezultat
	movw %dx, (%esi)
	jmp sledeci

neparan:                #menja poslednju i prvu cifru u bin. obliku
#prva maska
	movw %dx, %bx
	andw $0x001, %bx    #0x001 = 0b0000000000000001
	rorw $1 , %bx
#druga maska
	movw %dx, %di
	andw $0x8000, %di   #0x8000 = 0b1000000000000000
	rolw $1 , %di
	orw  %di, %bx
#treca maska
	andw $0x7FFE, %dx #0x7FFE = 0b0111111111111110
	orw  %bx, %dx
#vraca rezultat
	movw %dx, (%esi)

sledeci:
	addl $2  , %esi
	decl %ecx
	cmpl $0  , %ecx
	jne  pocetak

kraj_RazmeniBit:
	popl %edi
	popl %esi
	popl %ebx
	movl %ebp, %esp
	popl %ebp
	ret