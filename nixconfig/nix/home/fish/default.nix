{ config, pkgs, ... }:
{
  home.file."${config.xdg.configHome}/fish/conf.d" = {
    source = ./conf.d;
    recursive = true;
  };

  home.file."${config.xdg.configHome}/fish/extras" = {
    source = ./extras;
    recursive = true;
  };

  home.file."${config.xdg.configHome}/fish/functions" = {
    source = ./functions;
    recursive = true;
  };

  home.file."${config.xdg.configHome}/fish/config-linux.fish" = {
    source = ./config-linux.fish;
    recursive = false;
  };

  home.file."${config.xdg.configHome}/fish/config-macos.fish" = {
    source = ./config-macos.fish;
    recursive = false;
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting ""
      set -gx TERM xterm-256color
      set -gx VIMCONFIG $XDG_CONFIG_HOME/nvim
      set -gx EDITOR nvim
      set -gx VISUAL $EDITOR
      set -gx VOLTA_HOME $HOME/.volta

      # Make Nix and home-manager installed things available in PATH.
      set PATH /run/current-system/sw/bin $PATH
      set PATH /nix/var/nix/profiles/default/bin $PATH
      set PATH /etc/profiles/per-user/$USER/bin $PATH
      set PATH $HOME/.nix-profile/bin $PATH
      set PATH $HOME/.volta/bin $PATH

      source $HOME/.config/fish/functions/*.fish

      ulimit -S -n 10000

      if test -e "$XDG_CONFIG_HOME/fish/extra.fish"
        source $XDG_CONFIG_HOME/fish/extras/secret.fish
      end

      # Use atuin
      if status --is-interactive
        set -gx ATUIN_NOBIND true
        atuin init fish | source

        # bind to ctrl-r in normal and insert mode
        bind \cr _atuin_search
        bind -M insert \cr _atuin_search
      end

      if status --is-interactive
        # Managed by nix
        # starship init fish | source
      end

      switch (uname)
        case Darwin
          source (dirname (status --current-filename))/config-macos.fish
        case Linux
          source (dirname (status --current-filename))/config-linux.fish
        case '*'
          source (dirname (status --current-filename))/config-windows.fish
      end
    '';
    plugins = [
      { name = "z"; src = pkgs.fishPlugins.z.src; }
      { name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish.src; }
      { name = "bobthefish"; src = pkgs.fishPlugins.bobthefish.src; }
      { name = "fzf"; src = pkgs.fishPlugins.fzf.src; }
    ];
  };

  home.packages = with pkgs; [
    catppuccin
  ];
}
