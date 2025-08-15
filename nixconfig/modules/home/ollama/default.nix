{ config, ... }:
{
  home.file."${config.xdg.configHome}/ollama-code" = {
    source = ./config;
    recursive = true;
  };
}
