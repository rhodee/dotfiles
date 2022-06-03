-- LSP: https://github.com/rust-analyzer/rust-analyzer/releases
local nvim_lsp = require('lspconfig')
local cfg = require('config.lsp')

local opts = {
  capabilities = cfg.capabilities,
  on_attach = cfg.on_attach,
  tools = { -- rust-tools options
    autoSetHints = true,
      hover_with_actions = true,
      inlay_hints = {
        show_parameter_hints = false,
          parameter_hints_prefix = "",
          other_hints_prefix = "",
      },
  },
  server = {
    settings = {
      ["rust-analyzer"] = {
        assist = {
          importGranularity = "module",
          importPrefix = "by_self",
        },
        checkOnSave = {
          command = "clippy",
        },
        cargo = {
          loadOutDirsFromCheck = true
        },
        procMacro = {
          enable = true
        },
      }
    }
  }
}

require('rust-tools').setup(opts)

-------------------
-- Rust Settings --
-------------------
vim.g.rustfmt_autosave = 1
vim.g.rustfmt_recommended_style = 0
vim.g.rust_recommended_style = 0

local fn = require('config.lsp')
