{ config, pkgs, ... }:
{
  home.file."${config.xdg.configHome}/nvim" = {
    source = ./config;
    recursive = true;
  };

  programs.neovim = {
    enable = true;

    extraPackages = with pkgs;  [
      lazygit
    ];

    # Full list here,
    # https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/editors/vim/plugins/generated.nix
    plugins = with pkgs.vimPlugins; [
	  LazyVim
      catppuccin-vim
    ];

    withNodeJs = true;
    withPython3 = true;
    withRuby = false;

    viAlias = true;
    vimAlias = true;

    # Add library code here for use in the Lua config from the
    # plugins list above.
    extraConfig = ":luafile $XDG_HOME/nvim/init.lua";
  };

}
