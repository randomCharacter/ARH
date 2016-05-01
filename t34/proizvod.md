#proizvod dva 64bitna broja
Neka su <b>A</b> i <b>B</b> dva 64bitna broja  
Neka su a1 vise znacajne cifre, a a2 manje znacajne cifre broja <b>A</b>.  
Tada se <b>A</b> moze zapisati u sledecem obliku  <b>A</b> = a1 * 2^32 + a2   
Neka su b1 vise znacajne cifre, a b2 manje znacajne cifre broja <b>B</b>.  
Tada se <b>B</b> moze zapisati u sledecem obliku  <b>B</b> = b1 * 2^32 + b2   
Sada za proizvod <b>A</b>*<b>B</b> vazi   
	<b>A * B = (a1 * 2^32 + a2) * (b1 * 2^32 + b2) =  
	a1 * b1 * 2^64 + a1 * b2 * 2^32 + b1 * a2 * 2^32 + a2 * b2 =  
	a1 * b1 * 2^64 + (a1 * b2 + b1 * a2) * 2^32 + a2 * b2</b>   
   
   Iz ovog oblika se moze videti da ukoliko a1 * b1 nije 0 dolazi do prekoracenja, sto znaci da mora da vazi a1 = 0 ili b1 = 0   
   Vise znacajne cifre bice odredjene formulom a1 * b2 + b1 * a2, pri cemu se mora voditi racuna da ne dodje do prekoracenja   
   Manje znacajne cifre bice odredjene sa a2 * b2. Vise znacajne cifre rezultata ovog mnozenja moraju se dodati na vise znacajne cifre broja kako ne bi doslo do gubitaka   

   <i>Ekvivalentan asemblerski kod dat je u [t34/zad01.S](./zad01.S)<i>
