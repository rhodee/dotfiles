return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        css = { "stylelint" },
        go = { "gofmt", "goimports", "golines" },
        json = { "jq" },
        lua = { "stylua" },
        nix = { { "nixfmt", "alejandra" } },
        proto = { "buf" },
        python = { "black" },
        ruby = { "standardrb" },
        rust = { "rustfmt" },
        yaml = { "yamlfmt", "yamlfix" },
      },
      init = function()
        -- If you want the formatexpr, here is the place to set it
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
      end,
    },
  },
}
