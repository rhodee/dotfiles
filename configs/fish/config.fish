# for things not checked into git..
if test -e "$HOME/.extra.fish";
	source ~/.config/fish/extras/secret.fish
end

export REACT_EDITOR=code
export EDITOR=vim

status --is-interactive; and source (nodenv init -|psub)
eval (starship init fish)
