{ flake, config, lib, pkgs, ... }:
{
  home.file."${config.xdg.configHome}/nvim" = {
    source = ./config;
    recursive = true;
  };

  home.packages = with pkgs; [
    ast-grep
    golines
    luajitPackages.luarocks
    nodePackages.neovim
    yamlfix
    yamlfmt
    yamllint
    # (pkgs.python3.withPackages (python-pkgs: [ python-pkgs.pynvim ]))
  ];

  programs.neovim = {
    enable = true;

    viAlias = false;
    vimAlias = true;
    vimdiffAlias = true;

    # Full vim plugins list here,
    # https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/editors/vim/plugins/generated.nix
    plugins = with pkgs.vimPlugins; [
      (nvim-treesitter.withPlugins (_: pkgs.tree-sitter.allGrammars))
      aerial-nvim
      barbecue-nvim
      catppuccin-vim
      comment-nvim
      conform-nvim
      diffview-nvim
      mason-lspconfig-nvim
      mason-nvim
      neo-tree-nvim
      neotest
      neotest-plenary
      neotest-python
      neotest-rust
      nvim-code-action-menu
      nvim-lspconfig
      nvim-ufo
      nvim-window-picker
      plenary-nvim
      scope-nvim
      telescope-fzy-native-nvim
      telescope-nvim
      trouble-nvim
      undotree
      vim-just
      which-key-nvim
    ];

    # Add library code here for use in the Lua config from the
    # plugins list above.
    extraConfig = lib.fileContents ./config/init.lua;
  };
}
