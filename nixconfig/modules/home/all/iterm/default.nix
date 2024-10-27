{ flake, config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    iterm2
  ];
  home.file."iterm-catppuccin" = {
    source = ./colors;
    recursive = false;
  };
}