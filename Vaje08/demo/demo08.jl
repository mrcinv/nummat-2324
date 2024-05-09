#' # Hermitov zlepek

using Vaje08

x = range(0, 5pi, 7)
y = sin.(x)
dy = cos.(x)

using Plots

scatter(x, y)
Z = HermitovZlepek(x, y, dy)
plot!(x -> Z(x), 0, 5pi)
plot!(sin, 0, 5pi, label="sin")
