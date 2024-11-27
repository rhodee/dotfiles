{ pkgs, config, ... }:
{
  home.file.".gitconfig" = {
    source = ./gitconfig;
    recursive = false;
  };

  home.file.".gitmessage.txt" = {
    source = ./gitmessage.txt;
    recursive = false;
  };

  programs.gitui = {
    enable = true;
    catppuccin.enable = true;
  };

  home.shellAliases = {
    g = "git";
    gitui = "gitui -t catppuccin-macchiato.ron";
  };

  home.packages = with pkgs; [
    delta
    difftastic
    git-absorb
    git-extras
    git-interactive-rebase-tool
    gitFull
    gnupg
  ];
}
