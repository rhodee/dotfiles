{ pkgs, ... }:
{
  home.file."$HOME/.gitconfig" = {
    source = ./gitconfig;
    recursive = false;
  };

  home.file."$HOME/.gitmessage.txt" = {
    source = ./gitmessage.txt;
    recursive = false;
  };

  home.file."$HOME/.config/delta/themes/catppuccin.gitconfig" = {
    source = ./delta/catppuccin.gitconfig;
    recursive = false;
  };

  home.file."$HOME/.config/gitui" = {
    source = ./gitui/themes;
    recursive = true;
  };

  programs.gitui = {
    enable = true;
  };

  home.shellAliases = {
    g = "git";
    gitui = "gitui -t catppuccin-macchiato.ron";
  };

  home.packages = with pkgs; [
    delta
    difftastic
    git-extras
    gitFull
    git-interactive-rebase-tool
    gnupg
  ];
}
