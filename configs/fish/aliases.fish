# Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

# Utilities
function g        ; git $argv ; end
function grep     ; command grep --color=auto $argv ; end

alias push="git push"
alias changelog="git log --all --since='2 weeks' --oneline --no-merges $argv"
alias recap="git log --since=00:00:00 --all --no-merges --oneline --author $argv"

alias ag='ag --follow --hidden'

alias diskspace_report="df -P -kHl"
alias free_diskspace_report="diskspace_report"

alias master="git checkout master"

# Networking. IP address, dig, DNS
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias dig="dig +nocmd any +multiline +noall +answer"

# Shortcuts
alias g="git"
alias vim="nvim"
alias ungz="gunzip -k"
alias ll="exa --long --git -a --sort=accessed -h -B"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias gdoc="godoc -http=:6060; echo GoDoc exited on port 6060"
alias sandbox="cd $HOME/Development"
alias grem="git remote -v"

# File size
alias fs="stat -f \"%z bytes\""
alias yaegi='rlwrap yaegi'