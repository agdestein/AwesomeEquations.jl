"""
    forward_euler(f, u0, T, Δt = 0.1)

Solve ODE ``du/dt = f(u, t)`` with forward Euler.
"""
function forward_euler(f, u₀, T, Δt = 0.1)
    u = u₀
    n = round(Int, T / Δt)
    Δt = T / n
    t = 0.0
    for i = 1:n
        u = u + Δt * f(u, t)
        t = t + Δt
    end
    u
end

"""
    rk4(f, u0, T, Δt = 0.1)

Solve ODE ``du/dt = f(u, t)`` with RK4.
"""
function rk4(f, u₀, T, Δt = 0.1)
    u = u₀
    n = round(Int, T / Δt)
    Δt = T / n
    t = 0.0
    for i = 1:n
        k₁ = f(u, t)
        k₂ = f(u + Δt * k₁, t + Δt / 2)
        k₃ = f(u + Δt * k₂, t + Δt / 2)
        k₄ = f(u + Δt * k₃, t + Δt)
        u = u + Δt * (k₁ / 6 + k₂ / 3 + k₃ / 3 + k₄ / 6)
        t = t + Δt
    end
    u
end
