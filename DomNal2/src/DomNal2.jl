module DomNal2

using ForwardDiff

export gauss_legendre_2, gauss_legendre_error_estimate

# Function to calculate the Gauss-Legendre quadrature with two points
function gauss_legendre_2(f, a, b)
    x1 = (b - a) / 2 * (-1 / sqrt(3)) + (b + a) / 2
    x2 = (b - a) / 2 * (1 / sqrt(3)) + (b + a) / 2
    return (b - a) / 2 * (f(x1) + f(x2))
end

# Function to estimate the error of the Gauss-Legendre quadrature
function gauss_legendre_error_estimate(f, a, b)

    f_fourth = x -> ForwardDiff.derivative(t -> ForwardDiff.derivative(s -> ForwardDiff.derivative(u -> ForwardDiff.derivative(f, u), s), t), x)
    
    f_max = maximum([f_fourth(x) for x in range(a, b, length=1000)])

    return (b - a)^5 / 2880 * f_max
end

end
