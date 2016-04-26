#t34/zad01
#potprogram koji racuna zbir/razliku/proizvod 2 broja u zavisnosti od izabrane operacije
#autor: Mario Peric, E2
.section .data
.section .text
.global Racunaj
#long long Racunaj(long long *A, long long *B, char *operacija, int *greska)
Racunaj:
	pushl %ebp
	movl %esp, %ebp
	pushl %ebx
	pushl %esi
	pushl %edi

	movl 8(%ebp), %esi  #pokazivac na A
	movl 12(%ebp), %edi #pokazivac na B
	movl 16(%ebp), %ecx #pokazivac na operaciju

operacija:              #skace na odgovarajucu operaciju u zavisnosti od znaka
	cmpb $'+', (%ecx)
	je   zbir
	cmpb $'-', (%ecx)
	je   razlika
	cmpb $'*', (%ecx)
	je   proizvod
	jmp  greska

zbir:                   #racuna A+B
	movl (%esi),  %eax
	movl 4(%esi), %edx
	addl (%edi),  %eax
	adcl 4(%edi), %edx
	jo   prekoracenje
	jmp  rez

razlika:               #racuna A-B
	movl (%esi),  %eax
	movl 4(%esi), %edx
	subl (%edi),  %eax
	sbbl 4(%edi), %edx
	jo   prekoracenje
	jmp  rez

proizvod:              #racuna A-B
	movl (%esi),  %eax
	movl 4(%esi), %edx
	cmpl $0, %edx      #ukoliko su oba vise znacajna dela razlicita
	jz  mnozi          #od nula dolazi do prekoracenja
	cmpl $0, 4(%edi)
	jnz  prekoracenje

mnozi:                  #racuna A*B (proizvod.md za objasnjenje)
	imull 4(%edi), %eax
	jo   prekoracenje
	imull (%edi), %edx
	jo   prekoracenje
	addl  %eax, %edx
	jo   prekoracenje
	movl %edx, %ecx

	movl (%esi), %eax
	mull (%edi)
	cmpl $0, %edx
	js   prekoracenje
	addl %ecx, %edx
	jo   prekoracenje
	jmp  rez

greska:                 #pogresan karakter
	movl 20(%ebp), %ecx
	movl $1, (%ecx)

prekoracenje:           #izlazak iz opsega
	movl 20(%ebp), %ecx
	movl $-1, (%ecx)

rez:                    #nije doslo do greske, vracanje rezultata
	movl 20(%ebp), %ecx
	movl $0, (%ecx)

kraj_Racunaj:           #vracanje starih promenjivih
	popl %edi
	popl %esi
	popl %ebx
	movl %ebp, %esp
	popl %ebp
	ret