-- LSP: gem install solargraph
local nvim_lsp = require('lspconfig')

nvim_lsp.solargraph.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    },
}
