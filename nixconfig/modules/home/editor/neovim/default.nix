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
    neovim-node-client
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

    # 26.05 flipped these defaults to false for stateVersion >= 26.05; keep the
    # legacy providers (our stateVersion is still 25.11) and silence the warning.
    withRuby = true;
    withPython3 = true;
  };
}
