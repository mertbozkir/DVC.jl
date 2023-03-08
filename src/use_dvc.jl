function use_dvc(repo::GitRepo, git_commit = false, git_message = "Initialize DVC")
    # TODO: find reference for gitr2r:in_repository in julia
    # Check if in git repo
    if true == true
        # initialize DVC
        run(`dvc init`)
        if (git_commit)
            LibGit2.add!(repo, joinpath(mkpath(repo), ".dvc/.gitignore"))
            LibGit2.add!(repo, joinpath(mkpath(repo), ".dvc/config"))
            commit_oid = LibGit2.commit(repo, git_message);
            println("Is commit created? -" , LibGit2.iscommit(string(commit_oid), repo))
        end
    else
        println("No scm detected!")
    end
end




"""
use_dvc <- function(repo = here::here(), git_commit = TRUE, git_message = "Initialize DVC") {

  # Check if in git repo
  if(git2r::in_repository()) {

    # Initialize dvc
    cmd <- "dvc init"
    system(cmd)

    ## Add file and commit
    if(git_commit) {
      git2r::add(repo, fs::path(repo,".dvc/.gitignore"))
      git2r::add(repo, fs::path(repo,".dvc/config"))
      git2r::commit(repo, git_message)
    }
  }
  else {
    message("No scm detected.")
  }
}
"""