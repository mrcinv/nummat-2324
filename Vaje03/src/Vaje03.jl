module Vaje03

using SparseArrays

export laplaceova_matrika, desne_strani

"""
    L = laplaceova_matrika(n, m)

Zapiši matriko za Laplaceov operator v 2D na pravokotnem območju. 
Matrika `L` je matrika sistema enačb za diskretizirano laplaceovo enačbo

```math
u_{i-1,j}+u_{i,j-1} - 4u_{ij} + u_{i+1,j}+u_{i,j+1} = 0.
```
"""
function laplaceova_matrika(n, m)
  L = spdiagm(0 => -4 * ones(n), 1 => ones(n - 1), -1 => ones(n - 1))
  I = spdiagm(0 => ones(n)) # identiteta
  A = spzeros(n * m, n * m)
  for j = 1:m
    k = ((j-1)*n+1):(j*n) # indeksi v j-tem bloku  
    A[k, k] = L
    if j < m
      A[k, k.+n] = I
      A[k.+n, k] = I
    end
  end
  return A
end


"""
  b = desne_strani(s, z, l, d)

Generiraj desne strani za robni problem na pravokotniku [a, b]x[c, d].
s ... vektor robnih pogojev spodaj (y = c)
z ... vektor robnih pogojev zgoraj (y = d)
l ... vektor r. p. levo (x = a)
d ... vektor r. p. desno (x = b)
"""
function desne_strani(s, z, l, d)
  n = length(s)
  m = length(l)
  b = spzeros(n * m)
  b[1:n] -= s # j = 1
  b[n:n:end] -= d # i = n
  b[end-n+1:end] -= z # j = m
  b[1:n:end-n+1] -= l # i = 1
  return b
end

end # module Vaje03
