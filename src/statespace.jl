export AbstractStateSpace, ndim, volume, isuniform, encode, decode

abstract type AbstractStateSpace end

@unimpl Base.size(space::AbstractStateSpace)

ndim(space::AbstractStateSpace) = space.ndim

volume(space::AbstractStateSpace) = space.volume
Base.length(space::AbstractStateSpace) = volume(space)

isuniform(space::AbstractStateSpace) = space.isuniform

@unimpl encode(space::AbstractStateSpace, state)

@unimpl decode(space::AbstractStateSpace, code)

@unimpl Base.iterate(space::AbstractStateSpace)
@unimpl Base.iterate(space::AbstractStateSpace, state)
