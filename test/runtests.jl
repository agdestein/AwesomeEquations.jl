using AwesomeEquations
using Test

@testset "AwesomeEquations.jl" begin
    @testset "ODE solvers" begin
        f(u, t) = u
        g(u, t) = -t * u

        u0 = 2.0
        t = 3.0
        u_f = exp(t) * u0
        u_g = exp(-t^2 / 2) * u0

        @testset "Forward Euler" begin
            @test forward_euler(f, u0, t, 1e-4) ≈ u_f rtol = 1e-3
            @test forward_euler(f, u0, t, 1e-5) ≈ u_f rtol = 1e-4
            @test forward_euler(g, u0, t, 1e-4) ≈ u_g rtol = 1e-3
            @test forward_euler(g, u0, t, 1e-5) ≈ u_g rtol = 1e-4
        end

        @testset "RK4" begin
            @test rk4(f, u0, t, 1e-3) ≈ u_f rtol = 1e-3
            @test rk4(f, u0, t, 1e-4) ≈ u_f rtol = 1e-4
            @test rk4(g, u0, t, 1e-3) ≈ u_g rtol = 1e-2
            @test rk4(g, u0, t, 1e-4) ≈ u_g rtol = 1e-3
        end
    end
end

