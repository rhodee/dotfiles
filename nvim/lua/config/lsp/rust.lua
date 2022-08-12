-- LSP: https://github.com/rust-analyzer/rust-analyzer/releases
local nvim_lsp = require('lspconfig')
local cfg = require('config.lsp.attach')

local status, rt = pcall(require, 'rust-tools')
if (not status) then return end

local opts = {
  capabilities = cfg.capabilities,
  on_attach = cfg.on_attach,
  tools = { -- rust-tools options
    reload_workspace_from_cargo_toml = true,
    autoSetHints = true,
  },
  server = {
    standalone = true,
    -- settings = {
    --   ["rust-analyzer"] = {
    --     assist = {
    --       importGranularity = "module",
    --       importPrefix = "by_self",
    --     },
    --     checkOnSave = {
    --       command = "clippy",
    --     },
    --     cargo = {
    --       loadOutDirsFromCheck = true
    --     },
    --     procMacro = {
    --       enable = true
    --     },
    --   }
    -- }
  },
  dap = {
    adapter = {
      type = "executable",
      command = "lldb-vscode",
      name = "rt_lldb",
    },
  },
}

rt.setup(opts)

-------------------
-- Rust Settings --
-------------------
vim.g.rustfmt_autosave = 1
vim.g.rustfmt_recommended_style = 0
vim.g.rust_recommended_style = 0

