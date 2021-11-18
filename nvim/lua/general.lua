-----------------------------------------------------------
-- Neovim settings
-----------------------------------------------------------

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
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
----------------------------------------------------------------------------
opt("clipboard", "unnamedplus")
opt("swapfile", false, buffer)
opt("title", true)
opt("wrap", false, window)
opt("linebreak", true, window)
opt("shiftround", true)
opt("colorcolumn", "120", window)
opt("list", true)
opt("syntax", "enable")
opt("splitbelow", true)
opt("splitright", true)
opt("showmode", false)

----------------------------------------------------------------------------
-- Improve wrapping
----------------------------------------------------------------------------
opt("breakindent", true, window)
opt("breakindentopt", "shift:2", window)
opt("breakindentopt", "shift:2", window)
opt("showbreak", "↳")

----------------------------------------------------------------------------
-- Tabs, indent
----------------------------------------------------------------------------
opt("expandtab", true, buffer)
opt("shiftwidth", 2)
opt("smartindent", true, buffer)
opt("tabstop", 4, buffer)

-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove line lenght marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]

-- 2 spaces for selected filetypes
cmd [[
  autocmd FileType sql,xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
]]

----------------------------------------------------------------------------
-- Memory, CPU
----------------------------------------------------------------------------
opt("lazyredraw", true)
opt("history", 1000)
opt("synmaxcol", 300)
opt("hidden", true)

----------------------------------------------------------------------------
-- Display
----------------------------------------------------------------------------
opt("showmatch", true)
-- stop syntax highlight after x lines for performance
opt("laststatus", 2)
opt("eol", false)
opt("matchtime", 2)
opt("showcmd", true)


----------------------------------------------------------------------------
-- Search
----------------------------------------------------------------------------
opt("wildmenu", true)
opt("wildignore", '.git,*.swp,*.jpg,*.png,*.gif,.DS_Store')

----------------------------------------------------------------------------
-- Folds
----------------------------------------------------------------------------
opt("foldenable", false)
opt("foldlevel", 4)
opt("foldmethod", 'syntax')
opt("foldlevel", 20)
opt("foldmethod", "expr")
opt("foldexpr", "nvim_treesitter#foldexpr()")

-----------------------------------------------------------
-- Autocompletion
-----------------------------------------------------------
-- insert mode completion options
opt("completeopt", 'menuone,noselect')

----------------------------------------------------------------------------
-- SEARCH
-----------------------------------------------------------------------------
opt("ignorecase", true)
opt("infercase", true)
opt("hlsearch", true)
opt("incsearch", true)
opt("smartcase", true)

opt("gdefault", true) -- no need to add g at end of substitute / replace commands
opt("startofline", true)

-- prevent vim from adding line at the end of every file
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

-- highlight on yank
--
autocmd(
"misc_autocmds",
{
  [[TextYankPost * silent! lua vim.highlight.on_yank(higroup="IncSearch", timeout=700)]],
  [[Filetype qf set nobuflisted]],
  [[BufLeave * silent! :wa]],
},
true
)

-----------------------------------------------------------
-- Terminal
-----------------------------------------------------------
-- open a terminal pane on the right using :Term
cmd [[command Term :botright vsplit term://$SHELL]]

-- Terminal visual tweaks
--- enter insert mode when switching to terminal
--- close terminal buffer on process exit
cmd [[
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
    autocmd TermOpen * startinsert
    autocmd BufLeave term://* stopinsert
]]

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- disable builtins plugins
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end

-- remove whitespace on save
cmd [[au BufWritePre * :%s/\s\+$//e]]

