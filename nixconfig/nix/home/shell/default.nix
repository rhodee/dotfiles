{pkgs, ...}: {
  imports = [
    ./atuin.nix
    ./aws.nix
    ./container.nix
    ./cue.nix
    ./direnv.nix
    ./eza.nix
    ./fzf.nix
    ./infra.nix
    ./jq.nix
    ./pl.nix
    ./packages.nix
    ./starship.nix
    ./zoxide.nix
  ];
}
