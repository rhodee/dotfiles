{pkgs, ...}: {
  imports = [
    ./atuin.nix
    ./aws.nix
    ./container.nix
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
