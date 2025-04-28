{ config, pkgs, ... }:
{

  # TODO: Detect OS then write file
  home.file."${config.xdg.configHome}/tmux/macos.conf" = {
    source = ./tmux.macos.conf;
    recursive = false;
  };

  # TODO: Detect OS then write file
  home.file."${config.xdg.configHome}/tmux/linux.conf" = {
    source = ./tmux.linux.conf;
    recursive = false;
  };

  catppuccin.tmux.enable = true;

  programs.tmux = {
    enable = true;
    terminal = "screen-256color";
    secureSocket = false;
    extraConfig = builtins.readFile ./tmux.conf;
    shell = "${pkgs.fish}/bin/fish";
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.catppuccin;
      }
      {
        plugin = tmuxPlugins.continuum;
      }
      {
        plugin = tmuxPlugins.resurrect;
      }
      {
        plugin = tmuxPlugins.sensible;
      }
      {
        plugin = tmuxPlugins.tmux-which-key;
      }
      {
        plugin = tmuxPlugins.weather;
      }
      {
        plugin = tmuxPlugins.yank;
      }
    ];
  };

  home.packages = with pkgs; [
    tmux
    xclip
  ];
}
