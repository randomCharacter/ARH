#v06/zad01
#potprogram koji postavlja n-ti bit na vrednost v, a ostale na suprotno i to vraca kao rezultat
#autor: Mario Peric, E2
.section .data
.section .text
.globl maska
#unsigned int maska(unsigned int n, unsigned int v)
maska:
	pushl %ebp
	movl %esp, %ebp
	movl 8(%ebp), %ecx     #n->ecx
	movl $1, %edx          #maska (sve nule, 1 na kraju)
pocetak:
	jecxz zavrsi           #uslov za kraj
	shll %edx              #pomera 1 u masci za jedno mesto
	decl %ecx              #smanjuje preostali broj pomeranja
	jmp  pocetak           #ponavlja postupak
zavrsi:
	notl %edx              #radi negaciju pomocne maske
	movl %edx, %eax        #prebacuje rezultat u eax
	cmpl $0, 12(%ebp)      #ako je drugi argument 0 vraca rezultat
	je   rez
	notl %eax
	cmpl $1, 12(%ebp)      #ako je drugi argument 1 vraca negiran rezultat
	jng  rez
	movl $0, %eax          #ako nije ni 0 ni 1 vraca 0 kao gresku
rez:
	cmpl $32, 8(%ebp)      #ako je n manji od broja bitova u broju
	jl  kraj_maksa         #vraca prethodno kreiran rezultat
	movl $0, %eax          #inace vraca 0 kao gresku
kraj_maksa:
	movl %ebp, %esp
	popl %ebp
	ret