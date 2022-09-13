using AwesomeEquations
using Test

@testset "AwesomeEquations.jl" begin
    f(u, t) = u

    @testset "Forward EuleR" begin
        u0 = 1.0
        T = 5.0
        u_ref = exp(T) * u0
        @test forward_euler(f, u0, T, 0.00001) ≈ u_ref atol = 1e-2
        @test forward_euler(f, u0, T, 1e-6) ≈ u_ref atol = 1e-3
    end

    @testset "RK4" begin
        u0 = 1.0
        T = 5.0
        u_ref = exp(T) * u0
        @test rk4(f, u0, T, 0.001) ≈ u_ref atol = 1e-2
        @test rk4(f, u0, T, 0.0001) ≈ u_ref atol = 1e-3
    end
end
