-------------------
-- Local Imports --
-------------------
local fs = require('config.fs')
local sys = require('config.os')
local utils = require('config.utils')

local packer_bootstrap = false

-- Make sure packer is installed before executing the rest of the script
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fs.does_exist(install_path) then
  vim.cmd [[packadd packer.nvim]]
else
  utils.execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  utils.execute 'packadd packer.nvim'
  packer_bootstrap = true
end

local packer = require('packer')

packer.init({
  compiled_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim/lua/packer_compiled.lua'
})

-------------------
-- Load Packages --
-------------------
packer.startup(function(use)
    -- impatient.nvim has to be loaded before anything else,
    -- it's also required in init.lua
    use { 'lewis6991/impatient.nvim' }

    use {
        'wbthomason/packer.nvim',
        event = 'VimEnter',
    }

    -- Packages
    use 'nvim-lua/plenary.nvim'

    use 'folke/which-key.nvim'

    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = [[require('config.treesitter')]],
      requires = {
        {'p00f/nvim-ts-rainbow'},
        {'windwp/nvim-ts-autotag'},
        {'lewis6991/nvim-treesitter-context'},
        {'JoosepAlviste/nvim-ts-context-commentstring'},
        {'andymass/vim-matchup'},
      },
    }

    use {
      'neovim/nvim-lspconfig',
      config = [[require('config.lsp')]],
    }

    use 'editorconfig/editorconfig-vim'
    use 'bronson/vim-trailing-whitespace'
    use 'tpope/vim-surround'

    use {
     'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    }

    use {
      'folke/todo-comments.nvim',
      config = [[require('config.todo-comments')]]
    }

    -- TOML
    use 'cespare/vim-toml'

    -- Lua
    use 'tbastos/vim-lua'

    -- Go
    use {
      'ray-x/go.nvim',
      ft = { 'go', 'gomod' },
      config = function()
        require('go').setup({})
      end
    }

    -- TS
    use 'jose-elias-alvarez/typescript.nvim'

    -- Rust
    use 'simrat39/rust-tools.nvim'
    use 'rust-lang/rust.vim'

    -- Search
    use {
      'nvim-telescope/telescope-fzf-native.nvim',
      requires = {
        {'nvim-telescope/telescope.nvim'},
      },
      run = 'make'
    }

    use {
      'lewis6991/gitsigns.nvim',
      opt = true,
      requires = { 'nvim-lua/plenary.nvim' },
      config = [[require('config.gitsigns')]]
    }

    use 'stevearc/dressing.nvim'

    use {
      'nvim-telescope/telescope.nvim',
       requires = {
        'nvim-telescope/telescope-ui-select.nvim',
        'nvim-telescope/telescope-fzf-native.nvim',
        'nvim-lua/plenary.nvim'
      },
      config = [[require('config.telescope')]]
    }

    -- Code Completion
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-buffer'},
        {'saadparwaiz1/cmp_luasnip'},
        {'ray-x/cmp-treesitter'},
      },
      -- Error. Fix later.
      -- event = 'InsertEnter',
      config = [[require('config.cmp')]]
    }

    use {
      'L3MON4D3/LuaSnip',
      config = [[require('config.luasnip')]],
    }

    -- Theme
    use 'shaunsingh/nord.nvim'

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
      'windwp/nvim-autopairs',
      after = 'nvim-cmp',
      config = [[require('config.autopairs')]]
    }

    use {
      'lukas-reineke/indent-blankline.nvim',
      event = 'BufRead',
      config = [[require('config.blankline')]]
    }

    -- Symbols
    use {
      'simrat39/symbols-outline.nvim',
      cmd = { 'SymbolsOutline' },
    }

    use {
      'chentoast/marks.nvim',
      config = function()
        require('marks').setup({})
      end
    }

    use {
      'nvim-telescope/telescope-file-browser.nvim',
    }

    use {
      'folke/trouble.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
        require('trouble').setup({})
      end
    }

    -- Text Objects
    use {
      'phaazon/hop.nvim',
      branch = 'v1',
      config = [[require('config.hop')]]
    }

    -- DAP
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'

    if packer_bootstrap then
      require('packer').sync()
    end
end)

-- Load LSP configurations
require('languages')

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]