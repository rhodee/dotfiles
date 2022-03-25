-- LSP: https://github.com/rust-analyzer/rust-analyzer/releases
local nvim_lsp = require('lspconfig')

local on_attach = function(client)
  require('completion').on_attach(client)
end

local opts = {
  on_attach=on_attach,
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