{
  home.stateVersion = "22.11";
  imports = [
    ./gc.nix
    ./catppuccin.nix
    ./nix-index.nix
    ./fonts.nix
    ./all/bat
    ./all/fish
    ./all/tmux
    ./all/atuin.nix
    ./all/aws.nix
    ./all/broot.nix
    ./all/container.nix
    ./all/core-langs.nix
    ./all/cue.nix
    ./all/direnv.nix
    ./all/eza.nix
    ./all/fzf.nix
    ./all/infra.nix
    ./all/jq.nix
    ./all/ripgrep.nix
    ./all/starship.nix
    ./all/zoxide.nix
    ./packages.nix
  ];
}