module Domaca01

export Zlepek, interpoliraj, vrednost, plotDN

using LinearAlgebra
using Plots

struct Zlepek
    x::Vector{Float64}
    y::Vector{Float64}
    a::Vector{Float64}
    b::Vector{Float64}
    c::Vector{Float64}
    d::Vector{Float64}
end


function interpoliraj(x::Vector{Float64}, y::Vector{Float64})::Zlepek
  n = length(x) - 1
  h = diff(x)

  
  A = zeros(n + 1, n + 1)
  A[1, 1], A[end, end] = 1, 1
  v = zeros(n + 1)
  for i = 2:n
      A[i, i] = 2 * (h[i - 1] + h[i])
      A[i, i - 1] = h[i - 1]
      A[i, i + 1] = h[i]
      v[i] = 3 * (y[i + 1] - y[i]) / h[i] - 3 * (y[i] - y[i - 1]) / h[i - 1]
  end

  c = A \ v

  
  b = zeros(n)
  d = zeros(n)
  for i = 1:n
      b[i] = (y[i + 1] - y[i]) / h[i] - h[i] * (2c[i] + c[i + 1]) / 3
      d[i] = (c[i + 1] - c[i]) / (3 * h[i])
  end

  a = y[1:end-1]

  Zlepek(x, y, a, b, c[1:end-1], d)
end


function vrednost(z::Zlepek, x::Float64)::Float64
  for i = 1:length(z.x)-1
      if x >= z.x[i] && x <= z.x[i+1]
          dx = x - z.x[i]
          return z.a[i] + z.b[i]*dx + z.c[i]*dx^2 + z.d[i]*dx^3
      end
  end
  error("Value out of interpolation range.")
end


function plotDN(z::Zlepek)
  
  if length(z.x) < 2
      error("Not enough points to plot.")
  end
  
  
  first_xs = collect(range(z.x[1], stop=z.x[2], length=100))
  first_ys = [vrednost(z, xi) for xi in first_xs]
  p = Plots.plot(first_xs, first_ys, label="Spline", linewidth=2, color="red")
  
  
  for i in 2:length(z.x)-1
      segment_xs = collect(range(z.x[i], stop=z.x[i+1], length=100))
      segment_ys = [vrednost(z, xi) for xi in segment_xs]
      segment_color = (i-1) % 2 == 0 ? "blue" : "red"  
      Plots.plot!(p, segment_xs, segment_ys, label="", linewidth=2, color=segment_color)
  end

  
  Plots.scatter!(p, z.x, z.y, label="Data Points", color="red", marker=:circle, markersize=6)

  display(p)
end


end


