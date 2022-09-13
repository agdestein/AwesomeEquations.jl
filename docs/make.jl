using AwesomeEquations
using Documenter

DocMeta.setdocmeta!(AwesomeEquations, :DocTestSetup, :(using AwesomeEquations); recursive=true)

makedocs(;
    modules=[AwesomeEquations],
    authors="Syver Døving Agdestein <syverda@icloud.com> and contributors",
    repo="https://github.com/agdestein/AwesomeEquations.jl/blob/{commit}{path}#{line}",
    sitename="AwesomeEquations.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://agdestein.github.io/AwesomeEquations.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/agdestein/AwesomeEquations.jl",
    devbranch="main",
)
