module AwesomeEquations

"""
    forward_euler(f, u0, T, dt = 0.1)

Solve ODE ``du/dt = f(u, t)``
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

export forward_euler

end
