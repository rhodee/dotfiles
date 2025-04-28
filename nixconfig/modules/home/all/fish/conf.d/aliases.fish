# Navigation
function ..    ; z .. ; end
function ...   ; z ../.. ; end
function ....  ; z ../../.. ; end
function ..... ; z ../../../.. ; end

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
alias ungz="gunzip -k"
alias ll="eza --long --git -a --sort=accessed -h -B"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias gdoc="godoc -http=:6060; echo GoDoc exited on port 6060"
alias sandbox="z $HOME/Development"
# File size
alias fs="stat -f \"%z bytes\""

alias muxer="tmux attach-session -t rhodee || tmux new-session -s rhodee"

#docker
alias dc="docker-compose"
alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias docker_purge="docker rmi -f (docker images --filter "dangling=true" -q --no-trunc)"
alias docker_kill_all="docker stop (docker ps -a -q) ;and docker rm (docker ps -a -q) ;and docker image rm (docker image ls -q)"

