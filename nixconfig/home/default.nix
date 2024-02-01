{ config, flake, pkgs, ... }:
{
  imports = [
    ./neovim
    ./git
    ./fish
    ./terminal.nix
    ./bat
    ./tmux
    ./fonts.nix
  ];

  home.packages = with pkgs; [
    (python3.withPackages (ppkgs:  with ppkgs; [
      pip
      cookiecutter
    ]))
  ];

  # Recommended Nix settings
  nix = {
    registry.nixpkgs.flake = flake.inputs.nixpkgs; # https://yusef.napora.org/blog/pinning-nixpkgs-flake/
  };
}
