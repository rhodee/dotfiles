{ pkgs, ... }:
{
  home.file.".gitconfig" = {
    source = ./gitconfig;
    recursive = false;
  };

  home.file.".gitmessage.txt" = {
    source = ./gitmessage.txt;
    recursive = false;
  };

  catppuccin.gitui.enable = true;

  programs.gitui = {
    enable = true;
  };

  home.shellAliases = {
    g = "git";
    gitui = "gitui -t catppuccin-macchiato.ron";
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };

  programs.git = {
    enable = true;
  };

  home.packages = with pkgs; [
    git-absorb
    git-extras
    git-interactive-rebase-tool
    gnupg
  ];
}
