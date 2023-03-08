function push(targets::Vector{String}(), remote = false)
    targets = join(targets, " ")

    if remote
        remote = `--remote $remote`
    end

    run(`dvc push $remote $targets`)
end