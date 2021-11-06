-- local utils = require("config.utils")
-- local autocmd = utils.autocmd

require("nvim-treesitter.configs").setup {
  ensure_installed = {"comment", "lua", "rust", "yaml", "go", "hcl", "bash"},
  autotag = {
    enable = true
  },
  highlight = {
    enable = true
    additional_vim_regex_highlighting = true,
  }
  indent = {
    enable = true
  },
  matchup = {
    enable = true
  },
}

-- autocmd(
-- "deffolds",
-- {
--   [[
--   autocmd BufEnter * set foldmethod=expr
--   autocmd BufEnter * set foldmethod=nvim_treesitter#foldexpr()
--   set foldlevel=99
--   ]],
-- },
-- true
-- )