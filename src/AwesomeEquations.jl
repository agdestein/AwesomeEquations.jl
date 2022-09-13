module AwesomeEquations

include("solvers.jl")
include("dual.jl")
include("differentiation.jl")

export forward_euler, rk4
export Dual, finite_diff, forward_diff

end

