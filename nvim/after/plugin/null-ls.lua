local status, null_ls = pcall(require, 'null-ls')
if not status then return end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method('textDocument/formatting') then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        bufnr = bufnr,
                        async = false,
                        filter = function(client)
                            return client.name == "null-ls"
                        end
                    })
                end,
            })
        end
    end,
    sources = {
        null_ls.builtins.completion.luasnip,
        null_ls.builtins.code_actions.gitsigns,
        -- JS/TS
        null_ls.builtins.formatting.rome ,
        -- Go
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.diagnostics.staticcheck,
        null_ls.builtins.code_actions.gomodifytags,
        null_ls.builtins.code_actions.impl,
        null_ls.builtins.diagnostics.buf,
        null_ls.builtins.formatting.goimports,
        -- Rust
        null_ls.builtins.formatting.rustfmt,
        -- SQL
        null_ls.builtins.formatting.sqlfmt,
        -- null_ls.builtins.formatting.sqlfluff.with({
        --     extra_args = { "--dialect", "postgres" }, -- change to your dialect
        -- }),
    },
})