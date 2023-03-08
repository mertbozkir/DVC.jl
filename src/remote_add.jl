function remote_add(name, url, default = true, repo::GitRepo)
    if default
        default = `-d`
    else
        default = ``
    end
    
    run(`dvc remote add $default $name $url`)

    LibGit2.add!(repo, joinpath(mkpath(repo), ".dvc/config"))
    commit_oid = LibGit2.commit(repo, "Configure remote storage");
    println("Is commit created? -" , LibGit2.iscommit(string(commit_oid), repo))
    
end
