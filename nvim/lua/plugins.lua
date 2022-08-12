-------------------
-- Local Imports --
-------------------
local fs = require('config.util.fs')
local sys = require('config.util.os')
local utils = require('config.util.cmd')

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
      config = [[require('config.lsp.attach')]],
    }

    use {
     'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
      config = function()
        require('lsp_lines').setup()
        vim.diagnostic.config({ virtual_text = false })
      end
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

    -- Null LSP
    use 'jose-elias-alvarez/null-ls.nvim'

    -- Rust
    use 'simrat39/rust-tools.nvim'
    use 'rust-lang/rust.vim'

    -- Markdown
    use {
      "iamcco/markdown-preview.nvim",
      run = function()
        vim.fn["mkdp#util#install"]()
      end
    }

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
        'nvim-telescope/telescope-dap.nvim',
        'nvim-lua/plenary.nvim'
      },
      config = [[require('config.telescope')]]
    }

    -- Code Completion
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'saadparwaiz1/cmp_luasnip',
        'ray-x/cmp-treesitter',
      },
      -- Error. Fix later.
      -- event = 'InsertEnter',
      config = [[require('config.cmp')]]
    }

    use {
      'L3MON4D3/LuaSnip',
      config = [[require('config.luasnip')]],
    }

    use 'rafamadriz/friendly-snippets'

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

    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'weilbith/nvim-code-action-menu'

    use {
      'folke/trouble.nvim',
      requires = {'kyazdani42/nvim-web-devicons' },
      config = function()
        require('trouble').setup({
          action_keys = {
            hover = {},
          },
        })
      end
    }

    use {
      'nvim-neotest/neotest',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
        'antoinemadec/FixCursorHold.nvim',
        -- adapters
        'akinsho/neotest-go',
        'nvim-neotest/neotest-plenary',
      },
      config = [[require('config.test')]]
    }

    -- DAP
    --
    -- add dlv to $PATH separately
    use {
      'mfussenegger/nvim-dap',
      requires = {
        'rcarriga/nvim-dap-ui',
        'leoluz/nvim-dap-go',
        'theHamsta/nvim-dap-virtual-text',
      },
      config = [[require('config.dap')]]
    }

    if packer_bootstrap then
      require('packer').sync()
    end
end)

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Load LSP configurations
require('config.lsp')
