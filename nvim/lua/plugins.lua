-------------------
-- Local Imports --
-------------------
local fs = require('config.fs')
local sys = require('config.os')
local utils = require('config.utils')

-- Make sure packer is installed before executing the rest of the script
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fs.does_exist(install_path) then
  vim.cmd [[packadd packer.nvim]]
else
  utils.execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  utils.execute 'packadd packer.nvim'
end

local packer = require('packer')

-------------------
-- Load Packages --
-------------------
packer.startup(function()
    use {'wbthomason/packer.nvim', opt = true}
    -- Packages
    use {
      'folke/which-key.nvim',
      config = function()
        require('which-key').setup {}
      end
    }

    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = [[require('config.treesitter')]],
    }

    use {
      'neovim/nvim-lspconfig',
      config = [[require('config.lsp')]],
    }

    use 'editorconfig/editorconfig-vim'
    use 'bronson/vim-trailing-whitespace'
    use 'tpope/vim-surround'

    -- TOML
    use 'cespare/vim-toml'

    -- Lua
    use 'tbastos/vim-lua'

    -- Go
    use 'ray-x/go.nvim'

    -- Rust
    use 'simrat39/rust-tools.nvim'
    use 'rust-lang/rust.vim'

    -- Search
    use {
      'nvim-telescope/telescope-fzf-native.nvim',
      requires = {
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'},
      },
      run = 'make'
    }

    use {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = [[require('config.gitsigns')]]
    }

    use {
      'nvim-telescope/telescope.nvim',
      requires = {'nvim-lua/plenary.nvim'},
      config = [[require('config.telescope')]]
    }

    -- Code Completion
    use {
      'hrsh7th/nvim-cmp',
      config = [[require('config.cmp')]]
    }
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    -- Theme
    use {
      'ellisonleao/gruvbox.nvim',
      requires = {'rktjmp/lush.nvim'}
    }

    use {
      'nvim-lualine/lualine.nvim',
      event = 'VimEnter',
      requires = {'kyazdani42/nvim-web-devicons', opt = true},
      config = [[require('config.lualine')]],
      wants = 'nvim-web-devicons',
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons',
        },
        config = [[require('config.nvim-tree')]]
    }

    use {
      'windwp/nvim-autopairs',
      config = [[require('config.autopairs')]]
    }

    use {
      'lukas-reineke/indent-blankline.nvim',
      config = [[require('config.blankline')]]
    }

    -- Symbols
    use {
      'simrat39/symbols-outline.nvim',
      cmd = { 'SymbolsOutline' },
    }

    -- DAP
    use  'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'

end)

-- Load LSP configurations
require('languages')