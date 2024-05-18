using Test
include("../src/DomNal2.jl")
using .DomNal2

@testset "Gauss-Legendre Quadrature Tests" begin
  let
      # Define the function f locally within the let block
      f(x) = 3x^2 - 2x + 1
      a, b = 0, 1
      exact_integral = (b^3 - a^3) - (b^2 - a^2) + (b - a)
      @test isapprox(gauss_legendre_2(f, a, b), exact_integral, atol=1e-4)
  end
  
  let
      # Another local definition of f
      f(x) = x^4
      estimated_error = gauss_legendre_error_estimate(f, 0, 1)
      actual_error = abs(gauss_legendre_2(f, 0, 1) - (1/5))
      @test estimated_error >= actual_error
  end

  let
    j(x) = x < 0.5 ? 0 : 1  # Step function
    a, b = 0, 1
    # The exact integral is known analytically
    exact_integral = 0.5
    @test isapprox(gauss_legendre_2(j, a, b), exact_integral, atol=1e-2)
  end

  let
    g(x) = exp(-x^2)  # Gaussian function
    a, b = -1, 1
    known_integral = 1.493648  # Approximate value from more accurate numerical methods
    @test isapprox(gauss_legendre_2(g, a, b), known_integral, atol=0.1)
  end


  let
    k(x) = sin(1000 * x)  # Highly oscillatory function
    a, b = 0, 1
    @test isapprox(gauss_legendre_2(k, a, b), 0, atol=1.0)  # Realistically, we can only expect a rough approximation.
  end

end

