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

# Networking. IP address, dig, DNS
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias dig="dig +nocmd any +multiline +noall +answer"

# Recursively delete `.DS_Store` files
alias cleanup_dsstore="find . -name '*.DS_Store' -type f -ls -delete"

# Shortcuts
alias python="python3"
alias g="git"
alias vim="nvim"
alias cat="bat"
alias top="btm"
alias ungz="gunzip -k"
alias ll="exa --long  --git -a --sort=accessed -h -B"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias gdoc="godoc -http=:6060; echo GoDoc exited on port 6060"
alias sandbox="cd $HOME/Development"
alias grem="git remote -v"
# File size
alias fs="stat -f \"%z bytes\""

alias brew_update="brew -v update; brew upgrade; brew cleanup; brew doctor"

#docker
alias dc="docker-compose"
alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias docker_purge="docker rmi -f (docker images --filter "dangling=true" -q --no-trunc)"
alias docker_kill_all="docker stop (docker ps -a -q) ;and docker rm (docker ps -a -q) ;and docker image rm (docker image ls -q)"

