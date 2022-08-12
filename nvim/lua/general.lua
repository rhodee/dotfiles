----------------------------------------------------------------------------
-- Neovim settings--
----------------------------------------------------------------------------

----------------------------------------------------------------------------
-- Neovim API aliases--
----------------------------------------------------------------------------
local sys = require('config.util.os')
local utils = require('config.util.cmd')
local o = vim.o
local g = utils.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo
local api = vim.api
local exec = api.nvim_exec
local opt = utils.opt
local autocmd = utils.autocmd
local map = utils.map
local buffer = {o, bo}
local window = {o, wo}

local ok, _ = pcall(require, 'local.settings')
if not ok then
  -- not loaded
end

if sys.is_linux or sys.is_macos then
    o.undodir = os.getenv('HOME') .. '/.vim/undo-dir'
elseif sys.is_windows then
    o.undodir = fn.stdpath('data') .. '\\undo-dir'
end

-- Autocmd
vim.cmd('autocmd BufWritePost plugins.lua PackerCompile')
vim.cmd('autocmd BufRead,BufNewFile *.md,*.txt setlocal spell spelllang=en_us')
vim.cmd('autocmd BufRead,BufNewFile *.htm,*.html setlocal tabstop=2 shiftwidth=2 softtabstop=2')

----------------------------------------------------------------------------
-- Load Common Configuration
-- :options for full list.
----------------------------------------------------------------------------
opt("clipboard", "unnamedplus")
opt("swapfile", false, buffer)
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

-----------------------------------------------------------------------------
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
opt("shiftwidth", 4)
opt("smartindent", true, buffer)
opt("tabstop", 4, buffer)

-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove line length marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml setlocal cc=0]]

----------------------------------------------------------------------------
-- Memory, CPU
----------------------------------------------------------------------------
opt("lazyredraw", true) -- Faster scrolling
opt("history", 1000)
opt("synmaxcol", 300) -- max column for syntax highlight
opt("hidden", true) -- Enable background buffers
opt("updatetime", 700) -- ms to wait for trigger an event


-- use filetype.lua instead of filetype.vim
g.did_load_filetypes = 0
g.do_filetype_lua = 1
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
-- Folds (Treesitter managed)
----------------------------------------------------------------------------
opt("foldlevel", 4)
opt("foldmethod", "expr")
opt("foldexpr", "nvim_treesitter#foldexpr()")

----------------------------------------------------------------------------
-- Undo
----------------------------------------------------------------------------
opt("undofile", true)
opt("undolevels", 10000)

----------------------------------------------------------------------------
-- Autocompletion
----------------------------------------------------------------------------
opt("completeopt", 'menuone,noselect')
opt("wildignorecase", true)
opt("wildoptions", "pum")
opt("pumblend", 15)
opt("pumheight", 15)
opt("pumwidth", 20)
-- opt("wildmode", "full,longest")
-- opt("wildignore", "*.aux,*.out,*.toc,*.o,*.obj,*.dll,*.jar,*.pyc,*.rbc,*.class,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.avi,*.wav,*.webm,*.eot,*.otf,*.ttf,*.woff,*.doc,*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,.sass-cache,*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*.gem,*.*~,*~ ,*.swp,.lock,._*,tags.lock,.DS_Store")

---------------------------------------------------------------------------
-- Spelling
---------------------------------------------------------------------------
opt("spelloptions","camel")
opt("spellcapcheck", "") -- don't check for capital letters at start of sentence
opt("fileformats", "unix,mac,dos")

----------------------------------------------------------------------------
-- SEARCH
----------------------------------------------------------------------------
opt("ignorecase", true)
opt("smartcase", true)
opt("infercase", true)
opt("hlsearch", true)
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
opt("listchars", "tab:»·,trail:·,eol:¬,nbsp:·,extends:❯,precedes:❮,nbsp:%")
opt("shortmess", "ToOlxfitn")
opt("signcolumn", "yes")
vim.opt.formatoptions = {
  ["1"] = false,
  ["2"] = false, -- Use indent from 2nd line of a paragraph
  a = false, -- Auto formatting is BAD.
  q = true, -- continue comments with gq"
  c = false, -- Auto-wrap comments using textwidth
  r = false, -- Continue comments when pressing Enter
  o = false, -- Automatically insert the current comment leader after hitting 'o' or 'O'
  n = true, -- Recognize numbered lists
  t = false, -- autowrap lines using text width value
  j = true, -- remove a comment leader when joining lines.
  -- Only break if the line was not longer than 'textwidth' when the insert
  -- started and only at a white character that has been entered during the
  -- current insert command.
  l = false,
  v = false,
}

-- Encoding
opt("encoding", "utf-8")
opt("fileencoding", "utf-8")

-- Highlight on yank
autocmd(
"misc_autocmds",
{
  [[TextYankPost * silent! lua vim.highlight.on_yank(higroup="IncSearch", timeout=700)]],
  [[Filetype qf set nobuflisted]],
  [[BufLeave * silent! :wa]],
},
true
)

----------------------------------------------------------------------------
-- Terminal
----------------------------------------------------------------------------
-- open a terminal pane on the right using :Term
cmd([[command Term :botright vsplit term://$SHELL]])

--  Terminal visual tweaks
--  enter insert mode when switching to terminal
--  close terminal buffer on process exit
cmd([[
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
    autocmd TermOpen * startinsert
    autocmd BufLeave term://* stopinsert
]])

-- Check if we need to reload the file when it changed
cmd("au FocusGained * :checktime")

-- show cursor line only in active window
cmd([[
  autocmd InsertLeave,WinEnter * set cursorline
  autocmd InsertEnter,WinLeave * set nocursorline
]])

-- go to last loc when opening a buffer
cmd([[
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
]])

-- remove whitespace on save
cmd [[au BufWritePre * :%s/\s\+$//e]]

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
