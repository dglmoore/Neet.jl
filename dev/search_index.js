var documenterSearchIndex = {"docs": [

{
    "location": "#",
    "page": "Neet.jl",
    "title": "Neet.jl",
    "category": "page",
    "text": ""
},

{
    "location": "#Neet.jl-1",
    "page": "Neet.jl",
    "title": "Neet.jl",
    "category": "section",
    "text": "CurrentModule = Neet\nDocTestSetup = :(using Neet)Documentation for Neet.jl"
},

{
    "location": "core/#",
    "page": "Core API",
    "title": "Core API",
    "category": "page",
    "text": ""
},

{
    "location": "core/#Core-API-1",
    "page": "Core API",
    "title": "Core API",
    "category": "section",
    "text": ""
},

{
    "location": "core/#Neet.AbstractNetwork",
    "page": "Core API",
    "title": "Neet.AbstractNetwork",
    "category": "type",
    "text": "AbstractNetwork\n\nA supertype for all network types.\n\nTo implement the AbstractNetwork interface, a concrete subtype must provide the following methods:\n\nupdate!(net, dest, state)\nstatespace(net)\nneighbors(net, node, dir)\n\nThe following methods have default definitions which are usually sufficient.\n\nBase.size(net) - if net has as size property\nupdate!(net, state) - if update!(net, state, state) is well-behaved\nneighbors(net, nodes, dir)\nneighbors(net, dir)\n\n\n\n\n\n"
},

{
    "location": "core/#Base.size",
    "page": "Core API",
    "title": "Base.size",
    "category": "function",
    "text": "size(net::AbstractNetwork)\n\nReturn the number of nodes in net.\n\nNote: Concrete network subtypes need not define this method if they have a size property.\n\n\n\n\n\n"
},

{
    "location": "core/#Neet.update!",
    "page": "Core API",
    "title": "Neet.update!",
    "category": "function",
    "text": "update!(net::AbstractNetwork, dest::AbstractVector, state::AbstractVector)\nupdate!(net::AbstractNetwork, state::AbstractVector)\n\nUpdate a state according to the network rules specified by net, and store the result in dest. If dest is not provided, the state is updated in place. The updated state is returned.\n\nTypically dest must be at least as large as state; however, that may vary depending on the concrete network subtype.\n\nNote: Concrete network subtypes must define update!(net, dest, state). If it is safe to call update!(net, state, state), then update!(net, state) need not be overloaded (as that is the default definition).\n\n\n\n\n\n"
},

{
    "location": "core/#Neet.update",
    "page": "Core API",
    "title": "Neet.update",
    "category": "function",
    "text": "update(net::AbstractNetwork, state)\n\nUpdate a state according to the network rules specified by net, returning the result and leaving state unmodified.\n\nNote: Concrete network subtypes rarely need to overload this method as a default implementation is provided based on update!(net, dest, state). The exception to this rule is if the size or type of dest is not the same as state for the particular concrete network subtype.\n\n\n\n\n\n"
},

{
    "location": "core/#Neet.statespace",
    "page": "Core API",
    "title": "Neet.statespace",
    "category": "function",
    "text": "statespace(net::AbstractNetwork)\n\nReturn an AbstractStateSpace representing the state space of net.\n\nNote: Concrete network subtypes must define this method.\n\n\n\n\n\n"
},

{
    "location": "core/#Neet.neighbors",
    "page": "Core API",
    "title": "Neet.neighbors",
    "category": "function",
    "text": "neighbors(net::AbstractNetwork, node::Int[, dir::Symbol=:inout])\n\nReturn an array of the indicies of nodes of net which neighbor node. If dir is provided it must be one of\n\n:in - only return sources of edges incoming to node\n:out - only return targets of edges outgoing from node\n:inout - return all neighbors (:in and/or :out) of node\n\nNote: Concrete network subtypes must define this method.\n\n\n\n\n\nneighbors(net::AbstractNetwork, nodes[, dir::Symbol=:inout])\n\nReturn a collection of arrays of neighboring nodes, one for each node in the nodes collection. If dir is provided it must be one of :in:, :out, or :inout.\n\nNote: Concrete network subtypes should rarely need define this method.\n\n\n\n\n\nneighbors(net::AbstractNetwork[, dir::Symbol=:inout])\n\nReturn a vector of arrays of neighboring nodes, one for each node in net. If dir is provided it must be one of :in:, :out, or :inout.\n\nNote: Concrete network subtypes should rarely need define this method.\n\n\n\n\n\n"
},

{
    "location": "core/#AbstractNetwork-1",
    "page": "Core API",
    "title": "AbstractNetwork",
    "category": "section",
    "text": "AbstractNetwork\nsize\nupdate!\nupdate\nstatespace\nneighbors"
},

]}
