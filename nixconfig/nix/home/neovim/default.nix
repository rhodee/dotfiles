{ flake, config, lib, pkgs, ... }:
{
  home.file."${config.xdg.configHome}/nvim" = {
    source = ./config;
    recursive = true;
  };

  programs.neovim = {
    enable = true;
    viAlias = false;
    vimAlias = true;

    # Full list here,
    # https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/editors/vim/plugins/generated.nix
    plugins = with pkgs.vimPlugins; [
      aerial-nvim
      barbecue-nvim
      catppuccin-vim
      comment-nvim
      conform-nvim
      diffview-nvim
      mason-nvim
      mason-lspconfig-nvim
      neo-tree-nvim
      neotest
      neotest-go
      neotest-plenary
      neotest-python
      neotest-rust
      nvim-code-action-menu
      nvim-lspconfig
      nvim-ufo
      nvim-window-picker
      plenary-nvim
      telescope-nvim
      nvim-treesitter
      trouble-nvim
      undotree
      vim-just
    ];

    withNodeJs = true;
    withPython3 = true;
    withRuby = false;

    # Add library code here for use in the Lua config from the
    # plugins list above.
    extraConfig = lib.fileContents ./config/init.lua;
  };

}
