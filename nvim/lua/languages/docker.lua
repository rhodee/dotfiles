-- LSP: npm i -g dockerfile-language-server-nodejs
local nvim_lsp = require('lspconfig')

nvim_lsp.dockerls.setup{
  capabilities = capabilities,
  on_attach = lsp_on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}
