function git-tidy --description 'delete local branches whose remote was deleted (post-merge cleanup)'
    git fetch --all --prune
    # drops records for worktrees whose directory is already gone, so their
    # branches become deletable instead of "used by worktree"
    git worktree prune

    set -l current (git rev-parse --abbrev-ref HEAD)

    # a branch checked out in a live worktree cannot be deleted; collect those up
    # front so we name the worktree instead of letting `git branch -D` error out
    set -l held_branch
    set -l held_path
    set -l wt
    for line in (git worktree list --porcelain)
        set -l field (string split -m 1 ' ' -- $line)
        switch $field[1]
            case worktree
                set wt $field[2]
            case branch
                set -a held_branch (string replace 'refs/heads/' '' -- $field[2])
                set -a held_path $wt
        end
    end

    for entry in (git for-each-ref --format='%(refname:short) %(upstream:track)' refs/heads)
        set -l parts (string split ' ' -- $entry)
        test (count $parts) -ge 2; or continue
        test "$parts[2]" = '[gone]'; or continue

        set -l branch $parts[1]
        test "$branch" = "$current"; and continue

        if contains -- $branch $held_branch
            set -l i (contains -i -- $branch $held_branch)
            echo "skipped $branch: checked out at $held_path[$i]"
            echo "  git worktree remove $held_path[$i]; and git branch -D $branch"
            continue
        end

        git branch -D $branch
    end
end
