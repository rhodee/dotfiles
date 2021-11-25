set -xU VIMCONFIG '$HOME/.config/nvim'
set -xU VISUAL 'vim'
set -xU EDITOR "$VISUAL"
set -xU TERM 'xterm'
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

set fish_greeting

ulimit -S -n 10000

starship init fish | source

zoxide init fish | source

if test -e "$HOME/.extra.fish";
  source ~/.config/fish/extras/secret.fish
end
