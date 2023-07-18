return {
    'jose-elias-alvarez/null-ls.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      local null_ls = require 'null-ls'

      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      local formatting = null_ls.builtins.formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      -- local diagnostics = null_ls.builtins.diagnostics

      null_ls.setup {
        debug = false,
        sources = {
            formatting.autopep8,
            formatting.stylua,
            formatting.clang_format.with {
                filetypes = { 'cpp', 'c' },
            },
            null_ls.builtins.completion.luasnip,
            null_ls.builtins.code_actions.gitsigns,
            -- JS/TS
            null_ls.builtins.formatting.rome,
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
      }
    end,
}
