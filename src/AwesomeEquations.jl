module AwesomeEquations

"""
    forward_euler(f, u0, T, dt = 0.1)

Solve ODE ``du/dt = f(u, t)`` with forward Euler.
"""
function forward_euler(f, u0, T, dt = 0.1)
    u = u0
    n = round(Int, T / dt)
    dt = T / n
    t = 0.0
    for i = 1:n
        u = u + dt * f(u, t)
        t + dt
    end
    return u
end

"""
    rk4(f, u0, T, dt = 0.1)

Solve ODE ``du/dt = f(u, t)`` with RK4.
"""
function rk4(f, u0, T, dt = 0.1)
    u = u0
    n = round(Int, T / dt)
    dt = T / n
    t = 0.0
    for i = 1:n
        k1 = f(u, t)
        k2 = f(u + dt * k1, t + dt/2)
        k3 = f(u + dt * k2, t + dt/2)
        k4 = f(u + dt * k3, t + dt)
        u = u + dt * (k1 / 6 + k2 / 3 + k3 / 3 + k4 / 6)
        t + dt
    end
    return u
end

export forward_euler, rk4

end
