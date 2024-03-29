using Vaje02
using Test
T = Tridiag([1, 2], [3, 4, 5], [6, 7])
M = [3 6 0; 1 4 7; 0 2 5]
@testset "Tridiagonalna matrika" begin
  @test T[1, 1] == M[1, 1]
  @test T[2, 1] == M[2, 1]
  @test T[3, 2] == M[3, 2]
end
@testset "Produkt z vektorjem" begin
  @test isapprox(T * [1, 2, 3], M * [1, 2, 3])
end
@testset "Spreminjanje vrednosti" begin
  Tc = Tridiag(copy(T.sp), copy(T.d), copy(T.zg))
  Tc[2, 2] = 10
  @test Tc[2, 2] == 10
  Tc[1, 2] = 10
  @test Tc[1, 2] == 10
  Tc[2, 1] = 10
  @test Tc[2, 1] == 10
end
@testset "Deljenje z leve" begin
  T = Tridiag([1, 1, 1.0], [-2, -2, -2, -2.0], [1, 1, 1.0])
  b = [1, 1, 1, 1.0]
  x = T \ b
  @test isapprox(T * x, b)
end