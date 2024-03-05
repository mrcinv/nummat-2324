module Vaje02

export Tridiag

import Base: getindex, *, size

"""
Podatkovna struktura za tri diagonalno matriko. 
"""
struct Tridiag
  sp # vektor elementov na spodnji diagonali
  d  # vektor elementov na glavni diagonali
  zg # vektor elementov na zgornji diagonali
end

"""
Vrni dimenzije tridiagonalne matrike.
"""
size(T::Tridiag) = (length(T.d), length(T.d))

"""
   elt = T[i, j]

Vrni element v `i`-ti vrstici in `j`-tem stolpcu tridiagonalne matrike `T`
"""
function getindex(T::Tridiag, i, j)
  n, _m = size(T)
  if (i < 1) || (i > n) || (j < 1) || (j > n)
    throw("Indeksi so izven obsega matrike")
  end
  if i == j - 1
    return T.zg[i]
  elseif i == j
    return T.d[i]
  elseif i == j + 1
    return T.sp[j]
  else
    return zero(T.d[1])
  end
end

"""
    y = T*x

Izračunaj produkt tridiagonalne matrike `T` z vektorjem `x`.
"""
function *(T::Tridiag, x::Vector)
  y = zero(x)
  n = length(T.d)
  y[1] = T[1, 1] * x[1] + T[1, 2] * x[2]
  for i = 2:n-1
    y[i] = T[i, i-1] * x[i-1] + T[i, i] * x[i] + T[i, i+1] * x[i+1]
  end
  y[n] = T[n, n-1] * x[n-1] + T[n, n] * x[n]
  return y
end

end # module Vaje02
