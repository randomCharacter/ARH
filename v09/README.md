Napisati asemblerski program koji omogućava pomeranje tačke po monohromatskom ekranu
računara četvrte generacije i ispis njenih trenutnih koordinata u heksadecimalnom brojnom sistemu,
sa vodećim nulama (pogledati video zapis [Zadatak-A.mp4](./Zadatak-A.mp4) radi uvida šta se tačno traži; desni
klik, pa “Open with VLC”). Polje u kome se kreće tačka treba da bude uokvireno (kao na video
zapisu). Dodatni zadatak je da se istovremeno pomeraju 4 tačke ([Zadatak-B.mp4](./Zadatak-B.mp4)).
Video memorija monohromatskog ekrana se simulira nizom bajtova u promenljivoj "bitmap". Dat je
potprogram "printbitmap" koji iscrtava sadržaj te memorije u terminalu i koji se poziva jednom u
svakom ciklusu glavne petlje programa (nakon što su izvršene sve izmene na bitmapi). Veličinu
terminala treba prilagoditi ispisu, kako bi se videlo sve što se iscrtava (pogledati kako je veličina
podešena u video zapisu).
Monohromatski ekran se sastoji od RESX*RESY tačaka koje su grupisane u bajte, 8 tačaka po
bajtu. U video memoriji (bitmap) se na početku nalaze bajti prve linije, zatim bajti druge linije i
tako redom. U okviru jednog bajta, najznačajniji bit odgovara tački skroz levo, a najmanje značajan
tački skroz desno.
Trenutno dati glavni program samo pomera jednu tačku na sredini ekrana i ispisuje string ispod
bitmape. Treba ga izmeniti tako da radi isto što i program sa video zapisa. Zbog beskonačne petlje u
glavnom programu, izlaz iz programa je sa CTRL+C.   
Pomoć:
Simulacija pomeranja tačke se lako može uraditi ako se za svaku osu definišu promenljive za
koordinatu i smer, npr:   
<b>`x = 5`   
`smerx = 1`   
`...`   
`x = x + smerx`   
`if ((x<=min_x) or (x>=max_x)) smer = -smer`</b>   
U svakom ciklusu glavne petlje, prilikom iscrtavanja treba prvo obrisati tačku na tekućoj poziciji,
izračunati novu poziciju, pa iscrtati tačku na novoj poziciji.