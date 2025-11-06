{ config, ... }:
{
  home.file."${config.xdg.configHome}/zed" = {
    source = ./config;
    recursive = true;
  };
}
