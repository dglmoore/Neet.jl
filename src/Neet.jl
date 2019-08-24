module Neet

# provides the @unimpl macro
include("macros.jl")

# provides the AbstractNetwork interface
include("core.jl")

# provides the AbstractStateSpace interface
include("statespace.jl")

# provides the Boolean state space implementation
include("boolean/statespace.jl")

end
