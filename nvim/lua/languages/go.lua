local nvim_lsp = require('lspconfig')

local on_attach = function(client)
    require('completion').on_attach(client)
end

nvim_lsp.gopls.setup({
    dap_debug = true, -- set to true to enable dap
    dap_debug_keymap = true, -- set keymaps for debugger
    dap_debug_gui = true, -- set to true to enable dap gui, highly recommand
    dap_debug_vt = true, -- set to true to enable dap virtual text
})

require('go').setup({})

-- Run gofmt + goimport on save
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
