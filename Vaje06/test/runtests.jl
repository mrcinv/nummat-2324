using Vaje06, Test
using LinearAlgebra

@testset "Inverzna iteracija za 3x3 matriko" begin
  A = [
    2 1 3;
    1 1 2;
    3 2 1]
  F = lu(A)
  v, lambda = inviter(b -> F \ b, 3)
  @test isapprox(A * v, lambda * v)
end