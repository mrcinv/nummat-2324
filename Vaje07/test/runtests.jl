using Vaje07, Test

@testset "Presecčišče dve krožnic" begin
  F(x) = [(x[1] - 1)^2 + x[2]^2 - 4, (x[1] + 1)^2 + x[2]^2 - 4]
  JF(x) = 2 * [(x[1]-1) x[2]; (x[1]+1) x[2]]
  x, it = newton(F, JF, [1, 2])
  @test isapprox(x, [0, sqrt(3)])
end