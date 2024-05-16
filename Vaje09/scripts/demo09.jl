using Vaje09

#' Izračunajmo integral sin na [0, 1]

Ip = 1 - cos(1) # prava vrednost
x, w = trapez(0, 1, 5)
It5 = w' * sin.(x)

It5 = integral(sin, trapez, (0, 1, 5))
(It5 - Ip) / Ip
It10 = integral(sin, trapez, (0, 1, 10))
(It10 - Ip) / Ip

#' Graf napake v odvisnosti od števila korakov trapezne metode.

napaka_t(n) = Ip - integral(sin, trapez, (0, 1, n))

tabn = 2 .^ (1:10)
using Plots

scatter(tabn .+ 1, abs.(napaka_t.(tabn)), xaxis=:log10, yaxis=:log10, label="trapez")

# Približen red metode
hcat(ones(length(tabn)), log10.(tabn)) \ log10.(abs.(napaka_t.(tabn)))

#' Graf napake za Simpsonovo metodo
napaka_s(n) = Ip - integral(sin, simpson, (0, 1, n))

scatter!(2 * tabn .+ 1, abs.(napaka_s.(tabn)), xaxis=:log10, yaxis=:log10, label="Simpson")

#' Približen red Simpsonove metode
hcat(ones(length(tabn)), log10.(2 * tabn .+ 1)) \ log10.(abs.(napaka_s.(tabn)))

# Gauss-Legendre
Igl5 = integral(sin, gl, (0, 1, 5))
Igl5 - Ip

# Graf napake za Gauss-Legendrove kvadrature

napaka_gl(n) = Ip - integral(sin, gl, (0, 1, n))
scatter!(tabn, abs.(napaka_gl.(tabn)) .+ 5e-16, xaxis=:log10, yaxis=:log10, label="Gauss-Legendre")
