#v02/zad01
#smestiti 64-bitnu vrednost u cetiri 32-bitna rgistra
#autor: Mario Peric, E2
.section .data
A: 
	.long 0x12345678
.section .text
.globl main
main:
	movb A   , %al
	movb A+1 , %ah
	movb A+2 , %bl
	movb A+3 , %bh
kraj:
	movl $1  , %eax
	movl $0  , %ebx
	int $0x80