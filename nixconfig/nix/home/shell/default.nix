{pkgs, ...}: {
  imports = [
    ./atuin.nix
    ./direnv.nix
    ./eza.nix
    ./fzf.nix
    ./jq.nix
    ./pl.nix
    ./starship.nix
    ./zoxide.nix
  ];
}
