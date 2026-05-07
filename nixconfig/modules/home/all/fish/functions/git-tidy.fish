function git-tidy --description 'delete local branches whose remote was deleted (post-merge cleanup)'
    git fetch --all --prune
    set current (git rev-parse --abbrev-ref HEAD)
    for entry in (git for-each-ref --format='%(refname:short) %(upstream:track)' refs/heads)
        set parts (string split ' ' -- $entry)
        if test (count $parts) -ge 2; and test "$parts[2]" = "[gone]"
            set branch $parts[1]
            if test "$branch" != "$current"
                git branch -D $branch
            end
        end
    end
end
