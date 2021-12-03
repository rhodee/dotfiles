local ts_configs = require("nvim-treesitter.configs")

ts_configs.setup({
  ensure_installed = {
    "bash",
    "cmake",
    "comment",
    "css",
    "fish",
    "go",
    "gomod",
    "graphql",
    "html",
    "javascript",
    "json",
    "jsonc",
    "lua",
    -- "markdown",
    "python",
    "regex",
    "rust",
    "toml",
    "tsx",
    "typescript",
    "yaml",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false,
  },
  autotag = { enable = true },
  matchup = { enable = true },
  autopairs = { enable = true },
  context_commentstring = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  },
  move = {
    enable = true,
    set_jumps = true, -- whether to set jumps in the jumplist
    goto_next_start = { ["]m"] = "@function.outer", ["]]"] = "@class.outer" },
    goto_next_end = { ["]M"] = "@function.outer", ["]["] = "@class.outer" },
    goto_previous_start = { ["[m"] = "@function.outer", ["[["] = "@class.outer" },
    goto_previous_end = { ["[M"] = "@function.outer", ["[]"] = "@class.outer" },
  },
  lsp_interop = {
    enable = true,
    peek_definition_code = {
      ["gD"] = "@function.outer",
    },
  },
})

-- Add Markdown
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.jsonc.used_by = "json"
parser_config.markdown = {
  install_info = {
    url = "https://github.com/ikatyang/tree-sitter-markdown",
    files = { "src/parser.c", "src/scanner.cc" },
  },
}

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.used_by = { "javascript.jsx", "typescript.tsx", "javascriptreact", "typescriptreact"}
