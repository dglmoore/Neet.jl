export BooleanSpace

struct BooleanSpace <: AbstractStateSpace
    ndim::Int
    volume::Int
    isuniform::Bool
    function BooleanSpace(ndim)
        if ndim < 1
            throw(DomainError(ndim, "too few dimension, should be at least 1"))
        else
            new(ndim, 2^ndim, true)
        end
    end
end

Base.size(space::BooleanSpace) = tuple(fill(2, space.ndim)...)

volume(space::BooleanSpace) = space.volume

function encode(space::BooleanSpace, state::AbstractVector)
    code = 0
    for x in state
        code = (code << 1) | x
    end
    code
end

function decode(space::BooleanSpace, code::Int)
    state = Array{Int}(undef, space.ndim)
    for i in space.ndim:-1:1
        state[i] = code & 1
        code >>= 1
    end
    state
end

function Base.iterate(space::BooleanSpace)
    state = (1, zeros(Int, space.ndim))
    copy(state[2]), state
end

function Base.iterate(space::BooleanSpace, state::Tuple{Int, Vector{Int}})
    n, s = state
    if n != space.volume
        for i in space.ndim:-1:1
            if s[i] == 0
                s[i] = 1
                @views fill!(s[i+1:end], 0)
                break
            end
        end
        copy(s), (n + 1, s)
    end
end
