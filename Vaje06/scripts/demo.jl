#' # Inverzna iteracija

using LinearAlgebra
using Vaje06

A = [3 1 1; 1 1 3; 1 3 4]
F = lu(A)
resi(b) = F \ b
v, lambda = inviter(resi, 3)

#' Preizkusimo
norm(A * v - lambda * v, Inf)


eigen(A)

#' Če želimo poiskati kakšno lastno vrednost, ki ni najmanjša, naredimo premik.
F = lu(A - 2 * I)
v, lambda = inviter(b -> F \ b, 3)
lambda = lambda + 2

A * v - lambda * v

#' Za simetrične matrike lahko poiščemo z inverzno iteracijo več lastnih parov hkrati, 
#' če sproti vektorje ortonormiramo s qr razcepom.

A = [3 1 1; 1 1 3; 1 3 4]
F = lu(A)
x, lambda = inviterqr(b -> F \ b, rand(3, 2))

#' Oglejmo si primer za spektralno gručenje.

#' Kot primer vzamimo mešanico treh normalno porazdeljenih
#' oblakov točk v ravnini.
using Random

n = 100
Random.seed!(12)
x = [1 .+ randn(n, 1); -3 .+ randn(n, 1); randn(n, 1)]
y = [-2 .+ randn(n, 1); -1 .+ randn(n, 1); 1 .+ rand(n, 1)]
#g1 = randn(2, n) .+ [1, -2]
#g2 = randn(2, n) .+ [-3, -1]
#g3 = randn(2, n) .+ [0, 1]

using Plots
scatter(x, y)
#scatter(g1[1, :], g1[2, :], label="1. gruča")
#scatter!(g2[1, :], g2[2, :], label="2. gruča")
#scatter!(g3[1, :], g3[2, :], label="3. gruča")

#' Najprej zgradimo podobnostni graf:

oblak = hcat(x, y)
A = graf_eps(oblak', 0.9)

#' in izračunamo Laplaceovo matriko grafa:
L = laplace(A)

#' Poiščemo lastne vektorje matrike L za majhne lastne vrednosti

F = lu(L + 1e-5 * I)
v, lambda = inviterqr(b -> F \ b, 300, 10, 5000)

v

#' Za koordinate uporabimo lastne vektorje Laplaceove matrike
k, l = 4, 5
scatter(v[1:100, k], v[1:100, l])
scatter!(v[101:200, k], v[101:200, l])
scatter!(v[201:300, k], v[201:300, l])

#' Vgrajena funkcija eigen

v, l = eigen(Matrix(L))