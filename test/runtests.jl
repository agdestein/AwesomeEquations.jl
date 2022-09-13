using AwesomeEquations
using Test

@testset "AwesomeEquations.jl" begin
    f(u, t) = u
    u0 = 1.0
    T = 5.0
    u = forward_euler(f, u0, T, 0.01)
    u_ref = exp(T) * u0
    @test u ≈ u_ref atol = 1e-3
end
