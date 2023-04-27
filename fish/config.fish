set fish_greeting ""
set -gx TERM xterm-256color
set -gx VIMCONFIG '$HOME/.config/nvim'
set -gx VISUAL 'nvim'
set -gx EDITOR "$VISUAL"
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

source $HOME/.config/fish/functions/*.fish

ulimit -S -n 10000

zoxide init fish | source

if test -e "$HOME/config/fish/extra.fish";
  source ~/.config/fish/extras/secret.fish
end

# Use atuin
if status --is-interactive
  set -gx ATUIN_NOBIND "true"
  atuin init fish | source

  # bind to ctrl-r in normal and insert mode
  bind \cr _atuin_search
  bind -M insert \cr _atuin_search
end

# Use starship
if status --is-interactive
  starship init fish | source
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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/denisrhoden/google-cloud-sdk/path.fish.inc' ]; . '/Users/denisrhoden/google-cloud-sdk/path.fish.inc'; end

# Setting PATH for Python 3.11
# The original version is saved in /Users/denisrhoden/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.11/bin" "$PATH"

source /Users/denisrhoden/.docker/init-fish.sh || true # Added by Docker Desktop
