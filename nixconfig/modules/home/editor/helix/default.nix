{ config, pkgs, ... }:
{
  home.file."${config.xdg.configHome}/helix" = {
    source = ./config;
    recursive = true;
  };

  home.packages = with pkgs; [
    bun
    helix
    helix-gpt
  ];
}
