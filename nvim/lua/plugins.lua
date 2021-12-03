-- Bootstrapping to ensure packer is installed
local fn = vim.fn
if fn.empty(fn.glob(install_path)) > 0 then
  vim.cmd "packadd packer.nvim"
end

-- Run PackerCompile when plugins.lua is written.
vim.cmd(
  [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]
)

return require("packer").startup({
    function()
      -- https://github.com/wbthomason/packer.nvim/blob/daec6c759f95cd8528e5dd7c214b18b4cec2658c/doc/packer.txt#L534
      use {
        "wbthomason/packer.nvim"
      }

      -- General
      use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        opt = true,
        event = "BufRead",
        config = [[require('config.treesitter')]],
        wants = {
          "plenary.nvim",
          "popup.nvim",
          "telescope-fzy-native.nvim",
          "trouble.nvim",
          "telescope-symbols.nvim",
        },
        requires = {
          "nvim-lua/popup.nvim",
          "nvim-lua/plenary.nvim",
          "nvim-telescope/telescope-symbols.nvim",
          "nvim-telescope/telescope-fzy-native.nvim",
        },
      }

      use {
        "nvim-lua/plenary.nvim",
        module = "plenary"
      }

      use {
        "nvim-lua/popup.nvim",
        module = "popup"
      }

      use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make"
      }

      use {
        "folke/trouble.nvim",
        requires = {"kyazdani42/nvim-web-devicons", opt = true},
        config = [[require('config.trouble')]],
      }

      use {
        "nvim-telescope/telescope.nvim",
        requires = {"nvim-lua/plenary.nvim"},
        config = [[require('config.telescope')]]
      }

      -- Completion
      use {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        opt = true,
        wants = { "LuaSnip" },
        config = [[require('config.completion')]],
        requires = {
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-path",
          "hrsh7th/cmp-nvim-lua",
          "saadparwaiz1/cmp_luasnip",
          {
            "L3MON4D3/LuaSnip",
            wants = "friendly-snippets",
            config = [[require('config.snippets')]]
          },
          "rafamadriz/friendly-snippets",
        }
      }

      -- LSP
      use {
        "neovim/nvim-lspconfig",
        opt = true,
        event = "BufReadPre",
        module = "lspconfig",
        wants = {
          "cmp-nvim-lsp",
        },
        config = [[require('config.lsp')]],
      }

      -- Theme
      use {
        "ellisonleao/gruvbox.nvim",
        requires = {"rktjmp/lush.nvim"}
      }

      use {
        "nvim-lualine/lualine.nvim",
        event = "VimEnter",
        requires = {"kyazdani42/nvim-web-devicons", opt = true},
        config = [[require('config.lualine')]],
        wants = "nvim-web-devicons",
      }

      use {
        "windwp/nvim-autopairs",
        config = [[require('config.autopairs')]]
      }

      use {
        'lukas-reineke/indent-blankline.nvim',
        config = [[require('config.blankline')]]
      }

      use {
        'folke/twilight.nvim',
        config = [[require('config.twilight')]]
      }

      use {
        'folke/zen-mode.nvim',
        config = [[require('config.zen')]]
      }

      use {
        "kyazdani42/nvim-tree.lua",
        config = [[require('config.nvim-tree')]]
      }

      use {
        "ray-x/lsp_signature.nvim",
        config = [[require('config.signature')]]
      }

      -- Symbols
      use {
        "simrat39/symbols-outline.nvim",
        cmd = { "SymbolsOutline" },
      }

      -- Linting
      -- use {
      --   "dense-analysis/ale",
      --   config = [[require('config.ale')]]
      -- }

      -- T.Pope
      use {
        "tpope/vim-surround",
        "tpope/vim-fugitive",
        "tpope/vim-commentary",
        "tpope/vim-repeat",
      }

      use {
        "lewis6991/gitsigns.nvim",
        requires = {"nvim-lua/plenary.nvim"},
        config = [[require('config.gitsigns')]]
      }

      use {
        'norcalli/nvim-colorizer.lua',
        event = "BufReadPre",
        config = [[require('config.colorizer')]],
      }

      -- Go
      use {
        "ray-x/go.nvim",
        requires = {"nvim-treesitter/nvim-treesitter"},
      }

      -- Rust
      use {
        "rust-lang/rust.vim"
      }

    -- Debug with DAP
    use {
      "rcarriga/nvim-dap-ui",
    }

    use {
      "mfussenegger/nvim-dap",
      config = [[require('config.dap')]]
    }

    use {
      "theHamsta/nvim-dap-virtual-text",
      config = function()
        require("nvim-dap-virtual-text").setup()
      end,
    }

    -- Profiling
    -- usage: nvim --startuptime and then :StartupTime
    use {
      "dstein64/vim-startuptime",
      cmd = "StartupTime",
      config = [[vim.g.startuptime_tries = 10]]
    }
  end
})