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

  use {
	'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    event = 'VimEnter',
    requires = {
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
      'nvim-telescope/telescope-dap.nvim',
      'nvim-lua/plenary.nvim'
    },
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    cond = vim.fn.executable 'make' == 1
  }

  use {
    'folke/trouble.nvim',
    requires = {'kyazdani42/nvim-web-devicons' },
  }

  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'stevearc/dressing.nvim'
  use {
	'weilbith/nvim-code-action-menu',
	cmd = 'CodeActionMenu',
  }
  use {
    'kosayoda/nvim-lightbulb',
    requires = 'antoinemadec/FixCursorHold.nvim',
  }

  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'

  use 'numToStr/Comment.nvim'
  use 'folke/todo-comments.nvim'
  use 'simrat39/rust-tools.nvim'

  use {
    'lewis6991/gitsigns.nvim',
	event = { 'BufRead', 'BufNewFile' },
    requires = { 'nvim-lua/plenary.nvim' },
  }

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
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'hrsh7th/cmp-nvim-lsp-signature-help'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},

        {'https://git.sr.ht/~whynothugo/lsp_lines.nvim'},
	  }
  }

  use {
	'VonHeikemen/fine-cmdline.nvim',
	requires = {
      'MunifTanjim/nui.nvim'
	}
  }

  -- Themes
  use 'shaunsingh/nord.nvim'
  use {
    'ellisonleao/gruvbox.nvim',
    requires = {'rktjmp/lush.nvim'}
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
