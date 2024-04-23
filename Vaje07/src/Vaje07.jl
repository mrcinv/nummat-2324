module Vaje07

using LinearAlgebra
"""
  x, it = newton(f, Jf, x0)

Poišči rešitev sistema nelinearnih enačb `f(x)=0` z Newtonovo metodo. Argument `f` je
vektorska funkcija vektorske spremenljivke, `Jf` pa funkcija, ki izračuna Jacobijevo matriko
funkcije `f`. Argument `x0` je začetni približek.
"""
function newton(f, Jf, x0, maxit=100, tol=1e-10)
  for i = 1:maxit
    x = x0 - Jf(x0) \ f(x0) # en korak Newtonove iteracije
    if norm(x - x0, Inf) < tol
      return x, i
    end
    x0 = x
  end
  throw("Newtonova metoda ne konvergira po $maxit korakih.")
end

export newton

end # module Vaje07
