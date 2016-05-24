#v09/zad
#program koji ispisuje animaciju sa snimka u terminal
#autor: Mario Peric, E2
.section .data
RESX = 80   # horizontalna rezolucija, mora biti deljiva sa 8
RESY = 25   # vertikalna rezolucija
bitmap: .fill RESX*RESY/8,1,0   # video memorija
printnew: .ascii "\n\n\n\n\0"   # pomoćni stringovi za iscrtavanje video memorije
printdot:   .ascii "#\0"
printspc:   .ascii ".\0"
printx: .ascii "    X1=\0"      # dodatni string za ispis ispod bitmape
printx_len = .-printx
printy: .ascii "    Y1=\0"
printy_len = .-printy
stringx: .fill 3, 1, 0
stringx_len = .-stringx
stringy: .fill 3, 1, 0
stringy_len = .-stringy
X1: .long 0
Y1: .long 0
smerX: .long 0
smerY: .long 0


# konstanta za generisanje pauze prilikom iscrtavanja, treba je prilagoditi 
# sopstvenom računaru, ukoliko je animacija previše brza ili spora
PAUZA = 0x10000000

.section .text
.globl main
   
# void printbitmap()
# Potprogram koji iscrtava trenutni izgled monohromatskog ekrana
# Svaka uključena tačka se ispisuje kao karakter "printdot".
printbitmap:
    pushl %ebp
    movl %esp, %ebp
    pushl %ebx
    pushl %esi
    pushl %edi

    movl $RESX, %esi    # brojač X koordinate
    movl $RESY, %edi    # brojač Y koordinate
    movl $4, %eax       # ispis 4 newline-a
    movl $1, %ebx
    movl $printnew, %ecx
    movl $4, %edx
    int $0x80

    movl $bitmap, %edx  # pokazivač za prolazak kroz bitmapu

print_petlja1:
    movb (%edx), %bl    # 8 tačaka za ispis
    movb $8, %bh        # brojač tačaka

print_petlja2:
    movl $printspc, %ecx
    shlb $1, %bl        # da li se ispisuje tačka ili praznina?
    jnc print_ispis
    movl $printdot, %ecx
print_ispis:
    pushl %edx          # ispis tačke ili praznine
    pushl %ebx
    movl $4, %eax
    movl $1, %ebx
    movl $1, %edx
    int $0x80
    popl %ebx
    popl %edx

    decb %bh            # da li je ispisano 8 tačaka?
    jnz print_petlja2
    incl %edx           # prelazak na sledećih 8 tačaka
    subl $8, %esi       # da li je ispisan ceo red?
    jnz print_petlja1

    movl $RESX, %esi    # priprema brojača X koordinate za ispis sledećeg reda
    pushl %edx          # ispis jednog newline-a
    pushl %ebx
    movl $4, %eax
    movl $1, %ebx
    movl $printnew, %ecx
    movl $1, %edx
    int $0x80
    popl %ebx
    popl %edx

    decl %edi           # da li su ispisani svi redovi?
    jnz print_petlja1

    popl %edi           # vraćanje sačuvanih registara i završetak
    popl %esi
    popl %ebx
    movl %ebp, %esp
    popl %ebp
    ret


main:
    movl $RESX/2, X1
    movl $RESY/2, Y1
    # glavna petlja programa
petlja:
    #------------------------------------------------------------
    # samo pomera tačku na sredini ekrana i ispisuje jedan string
    # (umesto ovoga treba ubaciti rešenje zadatka)
    #------------------------------------------------------------
    call postavi_polja                  # postavlja potrebna polja na #
    call postavi_ram                    # postavlja ram
    call printbitmap                    # iscrtavanje bitmape
    movl $4, %eax                       # ispis poruke
    movl $1, %ebx
    movl $printx, %ecx
    movl $printx_len, %edx
    int $0x80
    #------------------------------------------------------------
    pushl $stringx_len                  # ispis vrednosti X koordinate u hex obliku
    pushl $stringx
    pushl X1
    call  u_hex
    addl  $12 , %esp                    # brisanje promenljivih sa steka

    movl $4, %eax                       # ispis X-a
    movl $1, %ebx
    movl $stringx, %ecx
    movl $stringx_len, %edx
    int $0x80
    #------------------------------------------------------------
    movl $4, %eax                       # ispis poruke
    movl $1, %ebx
    movl $printy, %ecx
    movl $printy_len, %edx
    int $0x80
    #------------------------------------------------------------
    pushl $stringy_len                  # ispis vrednosti Y koordinate u hex obliku
    pushl $stringy
    pushl Y1
    call  u_hex
    addl  $12 , %esp                    # brisanje promenljivih sa steka

    movl $4, %eax                       # ispis Y-a
    movl $1, %ebx
    movl $stringy, %ecx
    movl $stringy_len, %edx
    int $0x80
    #------------------------------------------------------------
    call obrisi_polja                   #brise polja
    call sledece_polje                  #prebacuje koordinate na sledece polje
    # na kraju glavne petlje programa se pravi pauza
    # kako bi uzastopna iscrtavanja ekrana dala animaciju
    movl $PAUZA, %eax
pauza:
    decl %eax
    jnz pauza
    jmp petlja          # izlaz iz programa je CTRL+C !!!

    movl $1, %eax
    movl $0, %ebx
    int $0x80

postavi_ram:
    pushl %ebp
    movl %esp, %ebp
    movl $bitmap, %ecx
prvi_red:               # postavljanje gornjeg dela rama
    movb $0xFF, (%ecx)
    incl %ecx
    cmpl $bitmap+(RESX-1)/8, %ecx
    jle prvi_red

    movl $bitmap+RESX*RESY/8 - RESX/8, %ecx
drugi_red:              # postavljanje donjeg dela rama
    movb $0xFF, (%ecx)
    incl %ecx
    cmpl $bitmap+RESX*RESY/8-1, %ecx
    jle drugi_red

    movl $bitmap, %ecx
okvir1:                 # postavljanje levog dela rama
    orb $0x80, (%ecx)
    addl $RESX/8, %ecx
    cmpl $bitmap+RESX*RESY/8, %ecx
    jl okvir1

    movl $bitmap+RESX/8-1, %ecx
okvir2:                 # postavljanje desnog dela rama
    orb $0x01, (%ecx)
    addl $RESX/8, %ecx
    cmpl $bitmap+RESX*RESY/8, %ecx
    jl okvir2

kraj_postavi_ram:
    movl %ebp, %esp
    popl %ebp
    ret

#void postavi_polja()
#postavlja potrebna polja na #
postavi_polja:
    pushl %ebp
    movl %esp, %ebp
    pushl %ebx
    pushl %esi
    pushl %edi
pocetak_postavi_polja:  # racunanje memorijske adrese po formuli $bitmap+Y1*RESX/8+X1/8
    movl Y1, %eax
    xorl %edx, %edx
    movl $RESX, %ebx
    mull %ebx
    movl $8, %ebx
    divl %ebx
    movl %eax, %esi
    movl X1, %eax
    movl $8, %ebx
    divl %ebx
    movb %dl, %cl
    addl %esi, %eax
    addl $bitmap, %eax
    movb $1, (%eax)
    incb %cl
    rorb %cl, (%eax)    # postavljanje odgovarajuceg bita u pronadjenom bajtu
kraj_postavi_polja:
    popl %edi           # vraćanje sačuvanih registara i završetak
    popl %esi
    popl %ebx
    movl %ebp, %esp
    popl %ebp
    ret

#void sledece_polje()
#prebacuje koordinate na sledece polje
sledece_polje:
    pushl %ebp
    movl %esp, %ebp
    pushl %ebx
    pushl %esi
    pushl %edi
pocetak_sledece_polje:
    cmpl $0, smerX      # proverava smer
    jne drugiX
prviX:                  # prvi smer
    incl X1
    movl X1, %eax
    cmpl $RESX-2, %eax
    jge promX
    jmp upitY
drugiX:                 # drugi smer
    decl X1
    movl X1, %eax
    cmpl $1, %eax
    jle promX
    jmp upitY
promX:                  # menjanje smera
    notl smerX
upitY:
    cmpl $0, smerY      # proverava smer
    jne drugiY
prviY:                  # prvi smer
    incl Y1
    movl Y1, %eax
    cmpl $RESY-2, %eax
    jge promY
    jmp kraj_sledece_polje
drugiY:                 # drugi smer
    decl Y1
    movl Y1, %eax
    cmpl $1, %eax
    jle promY
    jmp kraj_sledece_polje
promY:                  # menjanje smera
    notl smerY
kraj_sledece_polje:
    popl %edi           # vraćanje sačuvanih registara i završetak
    popl %esi
    popl %ebx
    movl %ebp, %esp
    popl %ebp
    ret    

#void obrisi_polja()
#brise prethodno postavljena polja
obrisi_polja:
    pushl %ebp
    movl %esp, %ebp
    pushl %ebx
    pushl %esi
    pushl %edi
pocetak_obrisi_polja:  #brise polje koje je prethodno postavljeno na 1
    movl Y1, %eax
    xorl %edx, %edx
    movl $RESX, %ebx
    mull %ebx
    movl $8, %ebx
    divl %ebx
    movl %eax, %esi
    movl X1, %eax
    movl $8, %ebx
    divl %ebx
    movb %dl, %cl
    addl %esi, %eax
    addl $bitmap, %eax
    movb $0, (%eax)     #brise polje
kraj_obrisi_polja:
    popl %edi           # vraćanje sačuvanih registara i završetak
    popl %esi
    popl %ebx
    movl %ebp, %esp
    popl %ebp
    ret

#void u_hex(int i, char* str, int duzina)
#prebacuje i u hex oblik i stavlja ga u string str
u_hex:
    pushl %ebp
    movl %esp, %ebp
    pushl %ebx
    pushl %esi
    pushl %edi
    movl $0  , %edi     #trenutna duzina stringa 
    movl 8(%ebp), %eax  #broj za konverziju
    movl 12(%ebp), %esi #pokazivac na string
    movl 16(%ebp), %ecx #max duzina stringa
    decl %ecx           #zbog '\0' na kraju
    movl $16  , %ebx    #baza sistema
konverzija:
    movl $0,  %edx      #zbog deljenja
    cmpl $0,  %ecx      #string je predugacak
    jl greska
    decl %ecx           #smanjuje broj preostalih dozvoljenih karaktera
    cmpl $0  , %eax     #kraj konverzije
    je kraj_konverzije
    divl %ebx           #uzimanje poslednje cifre
    cmpb $10, %dl
    jge  slovo
broj:
    addb $'0', %dl      #pretvaranje u znakovni oblik
    jmp  dalje
slovo:
    subb $10 , %dl
    addb $'A', %dl      #pretvaranje u znakovni oblik
dalje:
    movb %dl, (%esi)    #prebacivanje u string
    incl %esi           #prelazak na sledeci karakter
    incl %edi           #duzina stringa++
    jmp konverzija
kraj_konverzije:
    cmpl $1, %edi
    jg   bez_nule
dodaj_nulu:
    movb $'0', (%esi)
    incl %esi
bez_nule:    
    movb $0, (%esi)     #'\0' na kraj stringa
    decl %esi           #desni element = pokazivac na poslednji karakter stringa
    movl 12(%ebp), %edi #levi element = pokazivac na prvi karakter stringa
obrni:                  #obrce redosled u stringu
    cmpl %edi, %esi     #ako su se esi i edi mimoisli
    jbe kraj            #ide na kraj
    movb (%esi), %ah    #esi i edi menjaju mesta
    movb (%edi), %al
    movb %al, (%esi)
    movb %ah, (%edi)
    incl %edi           #pomera levi u desno
    decl %esi           #pomera desni u levo
    jmp obrni
greska:
    movl $1  , %eax
    jmp kraj_u_hex
kraj:
    movl $0  , %eax
kraj_u_hex:
    popl %edi
    popl %esi
    popl %ebx
    movl %ebp, %esp
    popl %ebp
    ret