using AwesomeEquations
using Test

@testset "AwesomeEquations.jl" begin
    @testset "ODE solvers" begin
        f(u, t) = u
        g(u, t) = -t * u

        u₀ = 2.0
        t = 3.0
        u_f = exp(t) * u0
        u_g = exp(-t^2 / 2) * u0

        @testset "Forward Euler" begin
            @test forward_euler(f, u₀, t, 1e-4) ≈ u_f rtol = 1e-3
            @test forward_euler(f, u₀, t, 1e-5) ≈ u_f rtol = 1e-4
            @test forward_euler(g, u₀, t, 1e-4) ≈ u_g rtol = 1e-3
            @test forward_euler(g, u₀, t, 1e-5) ≈ u_g rtol = 1e-4
        end

        @testset "RK4" begin
            @test rk4(f, u₀, t, 1e-3) ≈ u_f rtol = 1e-3
            @test rk4(f, u₀, t, 1e-4) ≈ u_f rtol = 1e-4
            @test rk4(g, u₀, t, 1e-3) ≈ u_g rtol = 1e-2
            @test rk4(g, u₀, t, 1e-4) ≈ u_g rtol = 1e-3
        end
    end

    @testset "Differentiaton" begin
        @test finite_diff(x -> x^2, 3.0) ≈ 6.0 rtol = 1e-8
        @test finite_diff(sin, 1.0) ≈ cos(1.0) rtol = 1e-8
        @test finite_diff(exp, 1.0) ≈ exp(1.0) rtol = 1e-8

        @test forward_diff(x -> x^2, 3.0) ≈ 6.0 rtol = 1e-8
        @test forward_diff(sin, 1.0) ≈ cos(1.0) rtol = 1e-8
        @test forward_diff(exp, 1.0) ≈ exp(1.0) rtol = 1e-8

        # Check that chain rule works correctly
        h(x) = exp(2 * sin(3x)^(1 / x + 4))
        @test forward_diff(h, 1.0) ≈ finite_diff(h, 1.0) rtol = 1e-7
    end
end
