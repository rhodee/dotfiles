local utils = require('user.util.cmd')
local autocmd = utils.autocmd

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

-- go to last location when opening a buffer
vim.cmd([[
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
]])

-- remove whitespace on save
vim.cmd([[au BufWritePre * :%s/\s\+$//e]])

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])