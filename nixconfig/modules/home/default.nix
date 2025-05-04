{
  home.stateVersion = "24.11";
  imports = [
    ./gc.nix
    ./catppuccin.nix
    ./nix-index.nix
    ./fonts.nix
    ./git
    ./all/atuin.nix
    ./all/aws.nix
    ./all/bat
    ./all/container.nix
    ./all/core-langs.nix
    ./all/coreutils.nix
    ./all/cue.nix
    ./all/direnv.nix
    ./all/eza.nix
    ./all/fish
    ./all/fzf.nix
    ./all/ghostty
    ./all/jq.nix
    ./all/ripgrep.nix
    ./all/starship.nix
    ./all/tmux
    ./all/zoxide.nix
    ./packages.nix
  ];
}
