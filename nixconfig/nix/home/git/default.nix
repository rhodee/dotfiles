{ config, pkgs, ... }:
{
  home.file."${config.home.homeDirectory}/.gitconfig" = {
    source = ./gitconfig;
    recursive = false;
  };

  home.file."${config.home.homeDirectory}/.gitmessage.txt" = {
    source = ./gitmessage.txt;
    recursive = false;
  };

  home.file."${config.xdg.configHome}/delta/themes" = {
    source = ./delta/catppuccin.gitconfig;
    recursive = false;
  };

  home.file."${config.xdg.configHome}/lazygit/themes" = {
    source = ./lazygit/themes-mergable;
    recursive = true;
  };

  programs.git = {
    enable = true;
    difftastic = { enable = true; };
  };

  programs.lazygit = {
    enable = true;
    settings = {
      gui.nerdFontsVersion = 3;
    };
  };

  home.packages = with pkgs; [
    delta
    difftastic
    git-extras
    git-interactive-rebase-tool
    gnupg
  ];
}
