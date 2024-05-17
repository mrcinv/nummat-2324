#Aleksa Ćirković

#Naloga je, da se poveže niz točk na grafu na gladek način. Obstaja več točk, vsaka s svojo X in Y vrednostjo, in je potrebno narisati gladko krivuljo, ki gre skozi vse te točke.

#Začne se s seznamom točk, ki jih je potrebno povezati. Vsaka točka ima X in Y vrednost.

#Za povezovanje teh točk z gladko krivuljo uporablja se "Naravni interpolacijski kubični zlepek". To pomeni, da med vsakim parom točk narišete mini-krivulje, ki se lepo prilegajo skupaj in ustvarijo eno gladko krivuljo.

#Na koncu se nariše ta krivulja na grafu. Za boljšo preglednost tudi so označene originalne točke in uporabljene različne barve za prikaz različnih delov krivulje.

#Struktura Zlepek je osnova. Hrani vse potrebne informacije o interpolacijskih točkah (x in y vrednosti) ter koeficiente (a, b, c, d), ki so potrebni za izračun kubičnih zlepkov.

#Funkcija interpoliraj izračuna koeficiente za kubični zlepek na podlagi danih točk. Uporablja matriko A in vektor v za rešitev sistema enačb, ki določajo koeficiente zlepka. Ti koeficienti so ključni za risanje gladke krivulje skozi vse dane točke.

#Funkcija vrednost omogoča izračun vrednosti interpolirane krivulje pri kateri koli danem x. To je uporabno za preverjanje, kako dobro krivulja ustreza podatkom ali za napovedovanje vrednosti na novih točkah.

#Funkcija plotDN prikaže graf, ki vizualno predstavi kako krivulja poteka skozi dane točke. Uporablja se za preverjanje pravilnosti interpolacije in za predstavitev rezultatov. Funkcija menja barve med segmenti krivulje, da olajša vizualno analizo.

using Domaca01
using Plots

# Nabor točk, za interpolacijo
x_tocke = [1.0, 2.0, 3.0, 4.0, 5.0]
y_tocke = [1.0, 4.0, 9.0, 16.0, 25.0]

# Funkcija interpoliraj za izračun koeficientov
zlepek = Domaca01.interpoliraj(x_tocke, y_tocke)

# Risanje grafa z uporabo funkcije plotDN
Domaca01.plotDN(zlepek)

# Prikaz vrednost krivulje na določeni točki
# Na primer, izračunati vrednost krivulje pri x = 2.5
vrednost_pri_2_5 = Domaca01.vrednost(zlepek, 2.5)
println("Vrednost krivulje pri x = 2.5 je: $vrednost_pri_2_5")

# Shranevanje grafa za poročilo
savefig("interpolacijska_krivulja.png")  
