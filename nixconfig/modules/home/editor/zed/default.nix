{ flake, config, lib, pkgs, ... }:
{
  home.file."${config.xdg.configHome}/zed" = {
    source = ./config;
    recursive = true;
  };

  home.packages = with pkgs; [];

  programs.zed-editor = {
    enable = true;

    extensions = ["nix" "go"];
  };
}
