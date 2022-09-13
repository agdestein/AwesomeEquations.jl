using AwesomeEquations
using Test

@testset "AwesomeEquations.jl" begin
    @testset "ODE solvers" begin
        f = (u, p, t) -> u
        g = (u, p, t) -> -t * u

        u₀ = 2.0
        t = 3.0
        u_f = exp(t) * u₀
        u_g = exp(-t^2 / 2) * u₀
        p = nothing

        @testset "Forward Euler" begin
            @test forward_euler(f, p, u₀, t, 1e-4) ≈ u_f rtol = 1e-3
            @test forward_euler(f, p, u₀, t, 1e-5) ≈ u_f rtol = 1e-4
            @test forward_euler(g, p, u₀, t, 1e-4) ≈ u_g rtol = 1e-3
            @test forward_euler(g, p, u₀, t, 1e-5) ≈ u_g rtol = 1e-4
        end

        @testset "RK4" begin
            @test rk4(f, p, u₀, t, 1e-3) ≈ u_f rtol = 1e-3
            @test rk4(f, p, u₀, t, 1e-4) ≈ u_f rtol = 1e-4
            @test rk4(g, p, u₀, t, 1e-3) ≈ u_g rtol = 1e-2
            @test rk4(g, p, u₀, t, 1e-4) ≈ u_g rtol = 1e-3
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
        f = x -> exp(2 * sin(3x)^(1 / x + 4))
        @test forward_diff(f, 1.0) ≈ finite_diff(f, 1.0) rtol = 1e-7
    end

    @testset "ODE differentiation" begin
        # Solve parameterized exponential equation ``du/dt = -p u``.
        # The solution is given by ``u(t) = \\exp(-p t) u``
        f = (u, p, t) -> -p * u 
        u₀ = 2.0
        t = 3.0
        p = 1.3

        # Differentiate forward Euler
        solve = p -> forward_euler(f, u₀, p, t)
        @test forward_diff(solve, p) ≈ finite_diff(solve, p) rtol = 1e-8

        # Differentiate RK4
        solve = p -> rk4(f, u₀, p, t)
        @test forward_diff(solve, p) ≈ finite_diff(solve, p) rtol = 1e-7
    end
end
