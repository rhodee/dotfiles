local ts_configs = require("nvim-treesitter.configs")

ts_configs.setup({
  ensure_installed = {
    "bash",
    "cmake",
    "comment",
    "css",
    "fish",
    "go",
    "graphql",
    "html",
    "javascript",
    -- "json",
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
    additional_vim_regex_highlighting = true,
  },
  autotag = { enable = true },
  matchup = { enable = true },
  autopairs = { enable = true },
  indent = { enable = true },
  context_commentstring = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-n>",
      node_incremental = "<C-n>",
      scope_incremental = "<C-s>",
      node_decremental = "<C-r>",
    },
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  },
  textsubjects = {
    enable = true,
    keymaps = {
      ["."] = "textsubjects-smart",
      [";"] = "textsubjects-container-outer",
    },
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