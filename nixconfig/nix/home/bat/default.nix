{ config, pkgs, ... }:
{

  # TODO: Detect OS then write file
  home.file."${config.xdg.configHome}/bat/config" = {
    source = ./config;
    recursive = false;
  };

  programs.bat = {
    enable = true;
  };
}
