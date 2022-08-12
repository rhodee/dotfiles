set fish_greeting ""
set -gx TERM xterm-256color
set -gx VIMCONFIG '$HOME/.config/nvim'
set -gx VISUAL 'nvim'
set -gx EDITOR "$VISUAL"
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

source $HOME/.config/fish/functions/*.fish

ulimit -S -n 10000

starship init fish | source

zoxide init fish | source

if test -e "$HOME/.extra.fish";
  source ~/.config/fish/extras/secret.fish
end

# Use starship
if status --is-interactive
  fish_config theme choose none
end

switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    source (dirname (status --current-filename))/config-linux.fish
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end