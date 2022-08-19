using EHTNCDBase
using Documenter

DocMeta.setdocmeta!(EHTNCDBase, :DocTestSetup, :(using EHTNCDBase); recursive=true)

makedocs(;
    modules=[EHTNCDBase],
    authors="Kazunori Akiyama",
    repo="https://github.com/EHTJulia/EHTNCDBase.jl/blob/{commit}{path}#{line}",
    sitename="EHTNCDBase.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://EHTJulia.github.io/EHTNCDBase.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/EHTJulia/EHTNCDBase.jl",
    devbranch="main",
)
