function install_dvc(with = `pip`, user = FALSE, remote = FALSE)
    # TODO: Implement FIFOStreams.jl or find a way to wrap remote inside backticks
    
        # for use with pip
        if(user)
            user = `--user`
        else
            user = ``
        end
    
        # install additional remote storage dependencies
        if(remote)
            remote = `[$remote]`
        else
            remote = ``
        end
    
        # select install command
        if(with == "pip") 
            command = `pip install dvc$remote $user`
        
        elseif (with == "conda")
            command = `conda install -c conda-forge dvc`
    
        elseif (with == "brew")
            command = `brew install dvc`
        
        elseif (with == "choco")
            command = `choco install dvc`
        
        elseif (with == "snap")
            command = `snap install --classic dvc`
        
        else
            println("Unknown dvc installer: $with")
    
        end
    
        run(`$command`)
    
    end