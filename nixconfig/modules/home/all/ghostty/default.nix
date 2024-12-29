{ config, pkgs, ... }:
{

  home.file."${config.xdg.configHome}/ghostty/themes" = {
    source = ./themes;
    recursive = true;
  };

  home.file."${config.xdg.configHome}/ghostty/config" = {
    source = ./config;
    recursive = false;
  };
}
