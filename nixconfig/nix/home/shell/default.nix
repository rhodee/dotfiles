{pkgs, ...}: {
  imports = [
    ./atuin.nix
    ./direnv.nix
    ./eza.nix
    ./fzf.nix
    ./infra.nix
    ./jq.nix
    ./pl.nix
    ./starship.nix
    ./zoxide.nix
  ];
}
