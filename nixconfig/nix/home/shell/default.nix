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
    ./packages.nix
    ./pl.nix
    ./ripgrep.nix
    ./starship.nix
    ./zoxide.nix
  ];
}
