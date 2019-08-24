using Documenter
using Neet

makedocs(
    sitename = "Neet",
    format = Documenter.HTML(),
    modules = [Neet],
    authors="Harrison Smith and Douglas G. Moore",
    pages = Any[
        "Home" => "index.md",
        "core.md"
    ]
)

deploydocs(
    repo = "github.com/dglmoore/Neet.jl.git"
)
