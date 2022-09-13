"""
    finite_diff(f, x; h = sqrt(eps(typeof(x))))

Compute the derivative of `f` at `x` using a central finite difference (second
order).
"""
finite_diff(f, x; h = sqrt(eps(typeof(x)))) = (f(x + h) - f(x - h)) / 2h

"""
    forward_diff(f, x)

Compute the derivative of `f` at `x` using forward mode automatic differention
(with dual numbers).
"""
forward_diff(f, x) = f(Dual(x, one(x))).der
