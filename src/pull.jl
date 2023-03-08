function pull(targets::Vector{String}(), remote = false)
    targets = join(targets, " ")

    if remote
        remote = `--remote $remote`
    end

    run(`dvc pull $remote $targets`)
end
