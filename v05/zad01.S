#v05/zad01
#potprogram int NZD(int A, int B), racuna NZD dva broja i program koji ga poziva
#autor: Mario Peric, E2
.section .data
A:
	.long 10
B:
	.long 14
R:
	.long 0
.section .text
.globl main
#int NZD (int A, int B)
NZD:
	pushl %ebp          #cuvanje FP-a
	movl %esp, %ebp     #postavljanje novog FP-a
	movl 8(%ebp), %ecx  #B -> ecx
	movl 12(%ebp), %edx #A -> edx
uporedi:                #poredi A i B i oduzimama manji od veceg dok se ne izjednace
	cmpl %ecx, %edx
	je   kraj_NZD
	jg   oduzmiB
oduzmiA:                #oduzima A od B
	subl %edx, %ecx
	jmp  uporedi
oduzmiB:                #oduzima B od A
	subl %ecx, %edx
	jmp  uporedi
kraj_NZD:
	movl %ecx, %eax     #vracanje rezultata
	movl %ebp, %esp     #brisanje lokalnig promenljivih
	popl %ebp           #vracanje prethodnog FP-a
	ret                 #zavrsetak potprograma
main:                   
	movl A   , %eax
	movl B   , %ebx
poziv:                  #prebacivanje podataka na stek u obrnutom redosledu
	pushl %ebx          #B -> stek
	pushl %eax          #A -> stek
	call NZD            #poziv podprograma
	addl $12 , %esp     #brisanje promenljivih sa steka
	movl %eax, R        #vracanje rezultata u memoriju
kraj:
	movl $1  , %eax
	movl $0  , %ebx
	int  $0x80