----------------------------------------------------------------------------
-- Neovim settings--
-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
----------------------------------------------------------------------------
local function augroup(name)
  return vim.api.nvim_create_augroup('lazyvim_' .. name, { clear = true })
end

vim.api.nvim_create_autocmd({ 'BufRead', 'BufReadPre' }, {
    group = augroup('reading_files_tab_default'),
    pattern = { 'markdown', 'text' },
    command = 'setlocal spell spelllang=en_us',
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufReadPre' }, {
    group = augroup('html_tab_default'),
    pattern = { 'htm', 'html' },
    command = 'setlocal tabstop=2 shiftwidth=2 softtabstop=2',
})

-- show cursor line only in active window
vim.api.nvim_create_autocmd({ 'InsertEnter', 'WinLeave' }, {
    command = 'set nocursorline'
})
vim.api.nvim_create_autocmd({ 'InsertLeave', 'WinEnter' }, {
    command = 'set cursorline'
})

-- go to last location when opening a buffer
vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
    group = augroup('last_loc'),
    command = [[ if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif ]]
})

-- remove whitespace on save
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    group = augroup('remove_space'),
    command = [[ :%s/\s\+$//e ]]
})

vim.api.nvim_create_autocmd({ 'BufRead' }, {
    command = [[ let &t_Ce = "\e[4:3m" ]],
    pattern = "*",
})

vim.api.nvim_create_autocmd({ 'BufRead' }, {
    command = [[ let &t_Ce = "\e[4:0m" ]],
    pattern = "*",
})

vim.api.nvim_create_autocmd({ 'Filetype' }, {
    group = augroup('line_len_remove'),
    pattern = { 'text', 'markdown', 'html', 'xhtml' },
    command = 'setlocal cc=0',
})

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    group = augroup('no_auto_commenting_new_line'),
    pattern = '*',
    command = 'set fo-=c fo-=r fo-=o',
})

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    group = vim.api.nvim_create_augroup('SharedLspSymbolsSidebar', { clear = true }),
    pattern = "*",
    callback = function()
        require("symbols-outline").open_outline()
    end
})