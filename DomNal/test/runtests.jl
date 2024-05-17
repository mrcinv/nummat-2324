using Test
using Domaca01


include("../src/Domaca01.jl")


@testset "Interpolation Accuracy" begin
    x_points = [1.0, 2.0, 3.0, 4.0]
    y_points = x_points .^ 2  
    spline = interpoliraj(x_points, y_points)
    
    for (x, expected_y) in zip(x_points, y_points)
        @test vrednost(spline, x) ≈ expected_y atol=1e-6
    end
end

@testset "Boundary Conditions" begin
  
  x_points = [0.0, 0.5, 1.0, 1.5, 2.0]
  y_points = [0.0, 0.25, 1.0, 2.25, 4.0]  
  spline = interpoliraj(x_points, y_points)

  
  plotDN(spline)  
  println("Manually verify boundary conditions in the plot.")
end


