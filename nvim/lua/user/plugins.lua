local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'folke/which-key.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    requires = {
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-telescope/telescope-dap.nvim',
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'kyoh86/telescope-windows.nvim',
      'crispgm/telescope-heading.nvim',
      'axkirillov/telescope-changed-files'
    },
  }

  use {
    'folke/trouble.nvim',
    requires = {'kyazdani42/nvim-web-devicons' },
  }

  use {
    'gorbit99/codewindow.nvim',
  }

  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'stevearc/dressing.nvim'

  -- Code Actions
  use {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  }

  use {
    'kosayoda/nvim-lightbulb',
    requires = 'antoinemadec/FixCursorHold.nvim',
  }

  -- Statusline
  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }

  use 'mbbill/undotree'
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-surround'

  use 'numToStr/Comment.nvim'
  use 'folke/todo-comments.nvim'
  use 'simrat39/rust-tools.nvim'

 	use {
    'TimUntersberger/neogit',
    requires = {
      'nvim-lua/plenary.nvim',
    }
  }

  use {
    'utilyre/barbecue.nvim',
    tag = '*',
    requires = {
      'SmiteshP/nvim-navic',
      'nvim-tree/nvim-web-devicons', -- optional dependency
    },
    -- after = 'nvim-web-devicons', -- keep this if you're using NvChad
  }

  use 'stevearc/aerial.nvim'

  use {
    'windwp/nvim-autopairs',
    after = 'nvim-cmp',
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
  }

  -- Test
  use {
    'nvim-neotest/neotest',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      -- adapters
      'nvim-neotest/neotest-plenary',
      'akinsho/neotest-go',
      'rouge8/neotest-rust',
      'nvim-neotest/neotest-plenary',
    },
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    }
  }

  use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},
        {'hrsh7th/cmp-nvim-lsp-signature-help'},
        {'williamboman/mason.nvim', run = ':MasonUpdate' },
        {'williamboman/mason-lspconfig.nvim'},

        -- Autocompletion
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lsp-signature-help'},
        {'hrsh7th/cmp-nvim-lua'},
        {'hrsh7th/cmp-path'},
        {'hrsh7th/nvim-cmp'},
        {'saadparwaiz1/cmp_luasnip'},

        -- Snippets
        {'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'},

        {'https://git.sr.ht/~whynothugo/lsp_lines.nvim'},
    }
  }

  use 'folke/lsp-colors.nvim'
  use {
    'm-demare/hlargs.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('hlargs').setup({})
    end
  }

  use {
    'VonHeikemen/fine-cmdline.nvim',
    requires = {
      'MunifTanjim/nui.nvim'
    }
  }

  -- Themes
  use {
    'EdenEast/nightfox.nvim',
    priority = 1000, -- make sure to load this before all the other start plugins
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  }

  -- DAP
  use {
    'mfussenegger/nvim-dap',
    opt = true,
    event = 'BufReadPre',
    module = { 'dap' },
    requires = {
        'ravenxrz/DAPInstall.nvim',
        'theHamsta/nvim-dap-virtual-text',
        'rcarriga/nvim-dap-ui',
        'nvim-telescope/telescope-dap.nvim',
    },
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
