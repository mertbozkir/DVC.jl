# Install dvc and add dvc
function add(path::AbstractString...; repo::GitRepo, git_commit = false, git_message = "Add raw data")
    """
    path:  Input files/directories to add.
    
    repo_path:  Path to root of repository (project root by default)
    
    git_commit:    Include git commits? (default: false)
    
    git_message:   Git commit message.
    """
        run(`dvc add $path`)
        if git_commit == true
            LibGit2.add!(repo, "{path}.dvc")
            LibGit2.add!(repo, joinpath(mkpath(path), ".gitignore"))
            commit_oid = LibGit2.commit(repo, git_message);
            println("Is commit created? -" , LibGit2.iscommit(string(commit_oid), repo))
        end
    end