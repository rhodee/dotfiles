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
    "hcl",
    "html",
    "javascript",
    "json",
    "jsonc",
    "lua",
    -- "markdown",
    "python",
    "regex",
    "ruby",
    "rust",
    "toml",
    "tsx",
    "typescript",
    "yaml",
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 1500,
  },
  matchup = {
    enable = true,
  },
})

-- Add Markdown
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.jsonc.filetype_to_parsename = "json"
parser_config.markdown = {
  install_info = {
    url = "https://github.com/ikatyang/tree-sitter-markdown",
    files = { "src/parser.c", "src/scanner.cc" },
  },
}

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsename = { "javascript.jsx", "typescript.tsx", "javascriptreact", "typescriptreact"}
