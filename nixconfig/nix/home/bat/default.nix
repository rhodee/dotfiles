{ config, pkgs, ... }:
{

  # TODO: Detect OS then write file
  home.file."${config.xdg.configHome}/bat/config" = {
    source = ./config;
    recursive = false;
  };

  home.file."${config.xdg.configHome}/bat/themes" = {
    source = ./themes;
    recursive = true;
  };

  programs.bat = {
    enable = true;
  };
}
