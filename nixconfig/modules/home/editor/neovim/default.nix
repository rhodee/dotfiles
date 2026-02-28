{ config, lib, pkgs, flake, ... }:
let
  inherit (flake) inputs;
in
{
  home.file."${config.xdg.configHome}/nvim" = {
    source = ./config;
    recursive = true;
  };

  home.packages = with pkgs; [
    ast-grep
    golines
    luajitPackages.luarocks
    nodePackages.neovim
    yamlfix
    yamlfmt
    yamllint
  ];

  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly.packages.${pkgs.stdenv.hostPlatform.system}.default;

    viAlias = false;
    vimAlias = true;
    vimdiffAlias = true;
  };
}
