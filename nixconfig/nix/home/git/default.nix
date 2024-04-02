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

  home.file."${config.xdg.configHome}/gitui" = {
    source = ./gitui_themes;
    recursive = true;
  };

  programs.git = {
    enable = true;
    difftastic = { enable = true; };
  };

  programs.gitui.enable = true;
  programs.lazygit.enable = true;

  home.packages = with pkgs; [
    delta
    git-extras
    git-interactive-rebase-tool
    difftastic
    gitui
    gnupg
  ];
}
