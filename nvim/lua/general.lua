local g = vim.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo
local utils = require("config.utils")
local opt = utils.opt
local autocmd = utils.autocmd
local map = utils.map

local buffer = {o, bo}
local window = {o, wo}

g.loaded_python_provider = 0
g.python_host_prog = "/usr/bin/python2"
g.python3_host_prog = "/usr/bin/python"

-- Language Bindings
require('config.go')

-- Misc
require('config.signature')
----------------------------------------------------------------------------
-- Load Common Configuration
-- :options for full list.
-- ----------------------------------------------------------------------------
opt("clipboard", "unnamedplus")
opt("swapfile", false, buffer)
opt("history", 1000)
opt("title", true)
opt("wrap", false, window)
opt("linebreak", true, window)
opt("tabstop", 2, buffer)
opt("shiftwidth", 2)
opt("expandtab", true, buffer)
opt("shiftround", true)
opt("lazyredraw", true)
opt("colorcolumn", "120", window)
opt("list", true)
opt("syntax", "enable")
opt("splitbelow", true)
opt("splitright", true)
opt("showmode", false)

-- Improve wrapping
opt("breakindent", true, window)
opt("breakindentopt", "shift:2", window)
opt("breakindentopt", "shift:2", window)
opt("showbreak", "↳")

-- Display
opt("showmatch", true)
-- stop syntax highlight after x lines for performance
opt("synmaxcol", 300)
opt("laststatus", 2)
opt("eol", false)
opt("matchtime", 2)
opt("showcmd", true)


-- Commands
opt("wildmenu", true)
opt("wildignore", '.git,*.swp,*.jpg,*.png,*.gif,.DS_Store')


-- Folds
opt("foldenable", false)
opt("foldlevel", 4)
opt("foldmethod", 'syntax')

-- code folding
opt("foldlevel", 20)
opt("foldmethod", "expr")
opt("foldexpr", "nvim_treesitter#foldexpr()")

-- no need to add g at end of substitute / replace commands
opt("gdefault", true)
----------------------------------------------------------------------------
-- SEARCH
-----------------------------------------------------------------------------
opt("ignorecase", true)
opt("infercase", true)
opt("hlsearch", true)
opt("incsearch", true)
opt("smartcase", true)

opt("startofline", true)

-- prevent vim from adding line at the end of every file
opt("hidden", true)
opt("binary", true)
opt("directory", ".")
opt("backspace", "eol,start,indent")

-- Lineno
opt("number", true, window)
opt("relativenumber", true, window)
opt("numberwidth", 3, window)

-- Reading/Writing
opt("timeout", true)
opt("ttimeout", true)
opt("timeoutlen", 500)
opt("ttimeoutlen", 500)

-- Moving Around/Editing
opt("cmdheight", 2)
opt("cursorline", true)

-- Bracket blinking.
opt("mat", 5)

-- For regular expressions turn magic on
opt("magic", true)
------------------------------------------------------------------------------
--FORMATTING
------------------------------------------------------------------------------
opt("title", true)
opt("showbreak", "↪⋯⋯")
opt("updatetime", 300)
opt("list", true)
opt("listchars", "tab:»·,trail:·,eol:¬,nbsp:·,extends:❯,precedes:❮")

-- Encoding
opt("encoding", "utf-8")
opt("fileencoding", "utf-8")

autocmd(
"misc_autocmds",
{
  [[TextYankPost * silent! lua vim.highlight.on_yank()]],
  [[Filetype qf set nobuflisted]],
  [[BufLeave * silent! :wa]],
},
true
)
