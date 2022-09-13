module AwesomeEquations

"""
    forward_euler(f, u0, T, dt = 0.1)

Solve ODE ``du/dt = f(u, t)``
"""
function forward_euler(f, u0, T, dt = 0.1)
    u = u0
    n = round(Int, T / dt)
    dt = T / n
    for i = 1:n
        u = u + dt * f(u, t)
    end
    return u
end

export forward_euler

end
