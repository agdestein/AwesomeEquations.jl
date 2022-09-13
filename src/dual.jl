"""
    Dual(a, b)

Dual number with value `a` and derivative `b`.

A dual number ``x = a + b \\epsilon`` is defined such that ``\\epsilon^2 = 0``
and ``f(a + b \\epsilon) = f(a) + f'(a) b \\epsilon`` for all ``f``. The
derivative of a function is thus given by ``f'(a) = y`` when ``f(a + \\epsilon)
= x + y \\epsilon``.
"""
struct Dual{T} <: Number
    val::T
    der::T
end

# Make all operations convert to Dual automatically
Base.promote(x, d::Dual) = (Dual(x, zero(x)), d)
Base.promote(d::Dual, x) = (d, Dual(x, zero(x)))

# Add common mathematical operations to Dual numbers
Base.:+(a::Dual, b::Dual) = Dual(a.val + b.val, a.der + b.der)
Base.:-(a::Dual, b::Dual) = Dual(a.val - b.val, a.der - b.der)
Base.:*(a::Dual, b::Dual) =
    Dual(a.val * b.val, a.val * b.der + a.der * b.val)
Base.:/(a::Dual, b::Dual) = Dual(
    (a.val * b.val - a.der * b.der) / b.val^2,
    (a.der * b.val - a.val * b.der) / b.val^2,
)

Base.sin(d::Dual) = Dual(sin(d.val), cos(d.val) * d.der)
Base.cos(d::Dual) = Dual(cos(d.val), -sin(d.val) * d.der)
Base.exp(d::Dual) = Dual(exp(d.val), exp(d.val) * d.der)
Base.log(d::Dual) = Dual(log(d.val), d.der / d.val)
Base.:^(a::Dual, b::Dual) = exp(b * log(a))
