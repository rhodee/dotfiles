
{ flake, config, lib, pkgs, ... }:
{
  home.file."${config.xdg.configHome}/helix" = {
    source = ./config;
    recursive = true;
  };

  home.packages = with pkgs; [
  ];

  programs.helix = {
    enable = true;
  };
}
