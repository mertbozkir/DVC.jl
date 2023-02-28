using DVC
using Documenter

DocMeta.setdocmeta!(DVC, :DocTestSetup, :(using DVC); recursive=true)

makedocs(;
    modules=[DVC],
    authors="Mert <mert.bozkirr@gmail.com> and contributors",
    repo="https://github.com/mertbozkir/DVC.jl/blob/{commit}{path}#{line}",
    sitename="DVC.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://mertbozkir.github.io/DVC.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/mertbozkir/DVC.jl",
    devbranch="main",
)
