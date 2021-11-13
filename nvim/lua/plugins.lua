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
      use "wbthomason/packer.nvim"

      -- NeoVim LSP
      use {
        "neovim/nvim-lspconfig",
        config = [[require('config.lsp')]],
      }

      -- General
      use {
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim"
      }

      use {
        "tpope/vim-surround",
      }

      use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make"
      }

      use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
      }

      use {
        "nvim-telescope/telescope.nvim",
        requires = {{"nvim-lua/plenary.nvim"}},
        config = [[require('config.telescope')]]
      }

      use {
        "kyazdani42/nvim-tree.lua",
        config = [[require('config.nvim-tree')]]
      }

      use {
        "ray-x/lsp_signature.nvim",
      }

      -- Completion
      use {
        "hrsh7th/nvim-cmp",
        config = [[require('config.completion')]]
      }

      use {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-path"
      }

      -- Completion (Snippets)
      use {
        'L3MON4D3/LuaSnip',
        config = [[require('config.completion')]]
      }

      -- Linting
      use {
        "dense-analysis/ale",
        config = [[require('config.ale')]]
      }

      -- Git
      use {
        "tpope/vim-fugitive",
        "tpope/vim-commentary",
      }

      use {
        "lewis6991/gitsigns.nvim",
        requires = {"nvim-lua/plenary.nvim"},
        config = [[require('config.gitsigns')]]
      }

      -- Go
      use {
        "ray-x/go.nvim",
      }

      -- Rust
      use {
        "rust-lang/rust.vim"
      }

      -- UI
      use {
        "ellisonleao/gruvbox.nvim",
        requires = {"rktjmp/lush.nvim"}
      }

    use {
      "hoob3rt/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true},
      config = [[require('config.lualine')]]
    }

    use {
      "windwp/nvim-autopairs",
      config = [[require('config.autopairs')]]
    }

    -- Debug with DAP
    use {
      "rcarriga/nvim-dap-ui",
    }

    use {
      "mfussenegger/nvim-dap",
      config = [[require('config.dap')]]
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