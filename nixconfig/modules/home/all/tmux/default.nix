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

  programs.tmux = {
    enable = true;
    catppuccin.enable = true;
    terminal = "screen-256color";
    secureSocket = false;
    extraConfig = builtins.readFile ./tmux.conf;
    shell = "${pkgs.fish}/bin/fish";
    plugins = with pkgs; [{
      plugin = tmuxPlugins.catppuccin;
      extraConfig = ''
        set -g @catppuccin_flavour 'mocha' # or frappe, macchiato, mocha

        set -g @catppuccin_window_left_separator ""
        set -g @catppuccin_window_right_separator " "
        set -g @catppuccin_window_middle_separator " █"
        set -g @catppuccin_window_number_position "right"

        set -g @catppuccin_window_default_fill "number"
        set -g @catppuccin_window_default_text "#W"

        set -g @catppuccin_window_current_fill "number"
        set -g @catppuccin_window_current_text "#W"

        set -g @catppuccin_status_modules_right "directory user host session"
        set -g @catppuccin_status_left_separator  " "
        set -g @catppuccin_status_right_separator ""
        set -g @catppuccin_status_right_separator_inverse "no"
        set -g @catppuccin_status_fill "icon"
        set -g @catppuccin_status_connect_separator "no"

        set -g @catppuccin_directory_text "#{pane_current_path}"
      '';
    }];
  };

  home.packages = with pkgs; [
    tmux
    xclip
  ];
}
