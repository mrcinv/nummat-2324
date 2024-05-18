Avtor:
Aleksa Ćirković

Opis naloge:
Ta projekt vključuje implementacijo numerične metode za izračun integralov s pomočjo Gauss-Legendreove kvadrature z dvema točkama. Cilj naloge je razviti in testirati funkcijo, ki omogoča aproksimacijo integrala poljubne funkcije na določenem intervalu. Projekt prav tako vključuje oceno napake integracije.

Kako uporabiti kodo:
  - Namestitev: Za zagon kode potrebujete programsko okolje Julia. Kodo prenesite na svoj računalnik.
  - Uvoz modula: V vašem Julia okolju uvozite modul z ukazom include("pot/do/DomNal2.jl"), kjer je "pot/do/" dejanska lokacija datoteke na vašem sistemu.
  - Uporaba funkcije: Po uvozu modula lahko funkcijo gauss_legendre_2 uporabite za izračun integrala funkcije na želenem intervalu, npr., gauss_legendre_2(f, 0, 1), kjer je f funkcija, ki jo želite integrirati.

Navodila za poganjanje testov:
Prepričajte se, da imate vse potrebne odvisnosti: Pred zagonom testov namestite vse potrebne pakete v Julia z Pkg.add("ImePaketa"). Jaz sem uporabil paket ForwardDiff, tako da ga morate namestiti.
Zagon testov: Teste poženete z vključitvijo datoteke runtests.jl znotraj vašega Julia okolja, na primer z include("pot/do/runtests.jl").
Kako ustvariti poročilo
Če želite ustvariti poročilo o izvedbi in rezultatih testov:

Zagon testov z beleženjem rezultatov: Teste poženite tako, da rezultate izpišete v datoteko ali jih zapišete v obliki, ki jo lahko kasneje obdelate.
Analiza rezultatov: Rezultate analizirajte ročno ali z orodji za avtomatizirano analizo, da ustvarite končno poročilo.