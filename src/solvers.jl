"""
    forward_euler(f, p, u₀, T, Δt = 0.1)

Solve ODE ``du/dt = f(u, p, t)`` with forward Euler, where ``p`` are
parameters.
"""
function forward_euler(f, p, u₀, T, Δt = 0.1)
    u = u₀
    n = round(Int, T / Δt)
    Δt = T / n
    t = 0.0
    for i = 1:n
        u = u + Δt * f(u, p, t)
        t = t + Δt
    end
    u
end

"""
    rk4(f, p, u₀, T, Δt = 0.1)

Solve ODE ``du/dt = f(u, p, t)`` with RK4, where ``p`` are parameters.
"""
function rk4(f, p, u₀, T, Δt = 0.1)
    u = u₀
    n = round(Int, T / Δt)
    Δt = T / n
    t = 0.0
    for i = 1:n
        k₁ = f(u, p, t)
        k₂ = f(u + Δt * k₁, p, t + Δt / 2)
        k₃ = f(u + Δt * k₂, p, t + Δt / 2)
        k₄ = f(u + Δt * k₃, p, t + Δt)
        u = u + Δt * (k₁ / 6 + k₂ / 3 + k₃ / 3 + k₄ / 6)
        t = t + Δt
    end
    u
end
