module Vaje07

using LinearAlgebra

"""
  x, it = newton(fdf, x0)

Poišči rešitev nelinearnega sistema enačb `f(x) = 0` z Newtonovo metodo.

## Argumenti

- fdf ... funkcija, ki računa vrednosti funkcije in Jacobijeve matrike za dani argument
- x0 ... začetni približek
- maxit ... največje število korakov, preden obupamo
- tol ... natančnost, s katero računamo približek (razlika dveh sosednjih približkov
  približkov)
- eps ... natančnost za vrednost f(x)
"""
function newton(fdf, x0, maxit=100, tol=1e-10, eps=1e-10)
  for i = 1:maxit
    f, Jf = fdf(x0)
    x = x0 - Jf \ f
    if norm(f, Inf) < eps || norm(x - x0) < tol
      return x, i
    end
    x0 = x
  end
  throw("Newtonova metoda ne konvergira po $maxit korakih.")
end

export newton

end # module Vaje07
