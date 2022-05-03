local nvim_lsp = require('lspconfig')
local cfg = require('config.lsp')

nvim_lsp.gopls.setup({
  capabilities = cfg.capabilities,
  on_attach = cfg.on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    gopls = {
      analyses = {
        nilness = true,
        unusedparams = true,
        unusedwrite = true,
        useany = true,
      },
      experimentalPostfixCompletions = false,
      gofumpt = false,
      staticcheck = true,
      usePlaceholders = true,
    },
  },
})

-- Run gofmt + goimport on save
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
