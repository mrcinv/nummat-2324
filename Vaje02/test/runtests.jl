using Vaje02
using Test

@testset "Tridiagonalna matrika" begin
  T = Tridiag([1, 2], [3, 4, 5], [6, 7])
  M = [3 6 0; 1 4 7; 0 2 5]
  @test T[1, 1] == M[1, 1]
  @test T[2, 1] == M[2, 1]
  @test T[3, 2] == M[3, 2]
  @testset "Produkt z vektorjem" begin
    @test isapprox(T * [1, 2, 3], M * [1, 2, 3])
  end
end