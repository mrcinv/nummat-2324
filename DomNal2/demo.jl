
include("../DomNal2/src/DomNal2.jl")
using .DomNal2  

# Poročilo
# Poročilo za projekt Gauss-Legendre Quadrature
# Avtor: Aleksa Cirkovic

# Opis naloge
# Naloga obravnava numerično integracijo z uporabo dvo-točkovne Gauss-Legendreove kvadrature. Metoda se temelji na aproksimaciji integrala funkcije preko dveh točk znotraj integracijskega intervala, ki minimizirata napako.

# Opis rešitve
# Implementirana funkcija gauss_legendre_2 izračuna integral dane funkcije na intervalu [a, b], kjer funkcija sprejme kot argumente funkcijo "f", spodnjo mejo "a" in zgornjo mejo "b". Za izračun napake se uporabi funkcija gauss_legendre_error_estimate, ki izračuna oceno napake kvadrature.


# Primer funkcije
f(x) = x^4 + sin(x)

# Izračun integrala
result = DomNal2.gauss_legendre_2(f, 0, 2)
error_estimate = DomNal2.gauss_legendre_error_estimate(f, 0, 2)

println("Rezultat integracije ∫ from 0 to 2 of x^4 + sin(x) dx: ", result)
println("Ocena napake: ", error_estimate)

