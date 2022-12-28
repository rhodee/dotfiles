----------------------------------------------------------------------------
-- Neovim settings--
----------------------------------------------------------------------------

----------------------------------------------------------------------------
-- Neovim API aliases--
----------------------------------------------------------------------------
local sys = require('rhodee.util.os')
local utils = require('rhodee.util.cmd')
local g = utils.g
local o, wo, bo, fn = vim.o, vim.wo, vim.bo, vim.fn
local opt = utils.opt
local autocmd = utils.autocmd
local buffer = {o, bo}
local window = {o, wo}

local ok, _ = pcall(require, 'local.settings')
if not ok then
  -- not loaded
end

-- Autocmd
vim.cmd('autocmd BufWritePost plugins.lua PackerCompile')
vim.cmd('autocmd BufRead,BufNewFile *.md,*.txt setlocal spell spelllang=en_us')
vim.cmd('autocmd BufRead,BufNewFile *.htm,*.html setlocal tabstop=2 shiftwidth=2 softtabstop=2')

-- ----------------------------------------------------------------------------
-- -- Load Common Configuration
-- -- :options for full list.
-- ----------------------------------------------------------------------------
opt("clipboard", "unnamedplus")
opt("wrap", false, window)
opt("linebreak", true, window)
opt("shiftround", true)
opt("colorcolumn", "120", window)
opt("syntax", "enable")
opt("splitbelow", true)
opt("splitright", true)
opt("showmode", false)
-- enable mouse mode
opt("mouse", "a")
-- confirm to save changes before exiting modified buffer
opt("confirm", true)
opt("textwidth", 120)

-- -----------------------------------------------------------------------------
-- -- Improve wrapping
-- ----------------------------------------------------------------------------
opt("breakindent", true)
opt("breakindentopt", "shift:2", window)
opt("breakindentopt", "shift:2", window)
opt("showbreak", "↳")

----------------------------------------------------------------------------
-- Tabs, indent
----------------------------------------------------------------------------
opt("expandtab", true, buffer)
opt("shiftwidth", 4)
opt("smartindent", true, buffer)
opt("tabstop", 4, buffer)

-- don't auto commenting new lines
vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove line length marker for selected filetypes
vim.cmd [[autocmd FileType text,markdown,html,xhtml setlocal cc=0]]

----------------------------------------------------------------------------
-- Memory, CPU
----------------------------------------------------------------------------
opt("lazyredraw", true) -- Faster scrolling
opt("history", 1000)
opt("synmaxcol", 300) -- max column for syntax highlight
opt("hidden", true) -- Enable background buffers
opt("updatetime", 250) -- ms to wait for trigger an event

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
-- Window splitting and buffers
----------------------------------------------------------------------------
-- exclude usetab as we do not want to jump to buffers in already open tabs
-- do not use split or vsplit to ensure we don't open any new windows

o.switchbuf = "useopen,uselast" -- "uselast"
vim.opt.fillchars = {
  vert = "│",
  fold = "⠀",
  eob = " ", -- suppress ~ at EndOfBuffer
  --diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
  msgsep = "‾",
  foldopen = "▾",
  foldsep = "│",
  foldclose = "▸",
}

opt("jumpoptions", "stack")
opt("virtualedit", "onemore")

----------------------------------------------------------------------------
-- Undo
----------------------------------------------------------------------------
opt("undofile", true)
opt("undolevels", 10000)
opt("swapfile",false)
opt("backup", false)
if sys.is_linux or sys.is_macos then
    o.undodir = os.getenv('HOME') .. '/.vim/undo-dir'
elseif sys.is_windows then
    o.undodir = fn.stdpath('data') .. '\\undo-dir'
end
----------------------------------------------------------------------------
-- Autocompletion
----------------------------------------------------------------------------
opt("completeopt", 'menuone,noselect')
opt("wildignorecase", true)
opt("wildoptions", "pum")
opt("pumblend", 15)
opt("pumheight", 15)
opt("pumwidth", 20)

---------------------------------------------------------------------------
-- Spelling
---------------------------------------------------------------------------
opt("spelloptions","camel")
opt("spellcapcheck", "") -- don't check for capital letters at start of sentence
opt("fileformats", "unix,mac,dos")

-- ----------------------------------------------------------------------------
-- -- SEARCH
-- ----------------------------------------------------------------------------
opt("ignorecase", true)
opt("smartcase", true)
opt("infercase", true)
opt("hlsearch", false)
opt("incsearch", true)

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
-- FORMATTING
------------------------------------------------------------------------------
opt("title", true)
opt("list", true)
-- opt("listchars", "tab:»·,trail:·,eol:¬,nbsp:·,extends:❯,precedes:❮,nbsp:%")
opt("shortmess", "ToOlxfitn")
opt("signcolumn", "yes", window)

-- Encoding
opt("encoding", "utf-8")
opt("fileencoding", "utf-8")

-- Highlight on yank
autocmd("misc_autocmds", {
  [[TextYankPost * silent! lua vim.highlight.on_yank(higroup="IncSearch", timeout=700)]],
  [[Filetype qf set nobuflisted]],
  [[BufLeave * silent! :wa]],
}, true)

----------------------------------------------------------------------------
-- Terminal
----------------------------------------------------------------------------
-- open a terminal pane on the right using :Term
-- vim.cmd([[command Term :botright vsplit term://$SHELL]])

--  Terminal visual tweaks
--  enter insert mode when switching to terminal
--  close terminal buffer on process exit
vim.cmd([[
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
    autocmd TermOpen * startinsert
    autocmd BufLeave term://* stopinsert
]])

-- Check if we need to reload the file when it changed
vim.cmd("au FocusGained * :checktime")

-- show cursor line only in active window
vim.cmd([[
  autocmd InsertLeave,WinEnter * set cursorline
  autocmd InsertEnter,WinLeave * set nocursorline
]])

-- go to last loc when opening a buffer
vim.cmd([[
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
]])

-- remove whitespace on save
vim.cmd [[au BufWritePre * :%s/\s\+$//e]]

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

require('rhodee.disable-builtins')
require('rhodee.keybindings')
require('rhodee.plugins')