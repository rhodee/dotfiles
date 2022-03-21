------------------------------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- GENERAL KEY MAP
-- :map for list mappings.
------------------------------------------------------------------------------
local map = vim.api.nvim_set_keymap
local opts = {noremap = true}
local g = vim.g

g.mapleader = ","
g.maplocalleader = ","

-- clear search highlighting
map('n', '<leader>c', ':nohl<CR>', opts)

-- map Esc to kk
map("i", 'kk', '<Esc>', opts)

-- fast saving with <leader> and s
map("n", "<Leader>w", ":w<CR>", opts)
map("i", "<Leader>w", "<C-c>:w<CR>", opts)

-- close all windows and exit from neovim
map("n", '<Leader>q', ":qa!<CR>", opts)

-- Telescope
map("n", "<C-p>", ":Telescope find_files<Return>", opts)
map("n", "<C-f>", ":Telescope live_grep<Return>", opts)
map("n", "<C-b>", ":Telescope buffers<Return>", opts)
map("n", "<C-h>", ":Telescope help_tags<Return>", opts)

-- Terminal
map('n', '<C-t>', ':Term<CR>', { noremap = true })

-- Get to command mode faster
map("n", ";", ":", opts)
map("v", ";", ":", opts)
map("x", ";", ":", opts)

-- jump to start and end of line
map("n", "H", "^", opts)
map("n", "L", "$", opts)

-- clear search highlights
map("n", "<Leader><Return>", ":noh<Return>", opts)

-- switch between the last two files
map("n", "<Leader><Leader>", "<C-^>", opts)

-- Tree
map("n", "<Leader><space>", ":Telescope file_browser<CR>", opts)

-- move between buffer
map("n", "<Leader>h", "<C-W>h", opts)
map("n", "<Leader>l", "<C-W>l", opts)
map("n", "<Leader>k", "<C-W>k", opts)
map("n", "<Leader>j", "<C-W>j", opts)

-- narrower window
map("n", "<Leader>-", "<C-W><", opts)
-- wider window
map("n", "<Leader>+", "<C-W>>", opts)
-- shorter window
map("n", "-", "<C-W>-", opts)
-- taller window
map("n", "+", "<C-W>+", opts)

-- Open new splits easily
map("n", "vv", "<C-W>v", opts)
map("n", "ss", "<C-W>s", opts)
map("n", "sq", "<C-W>q", opts)

-- more natural movement with wrap on
map("n", "j", "gj", opts)
map("n", "k", "gk", opts)
map("v", "j", "gj", opts)
map("v", "k", "gk", opts)

-- indent like ST2
map("n", "<Leader>]", ">>", opts)
map("n", "<Leader>[", "<<", opts)
map("v", "<Leader>[", "<gv", opts)
map("v", "<Leader>]", ">gv", opts)

-- Paste with current indentation
map("n", "<Leader>p", "]p", opts)

-- Bind :Q to :q
map("n", "<C-q>", ":confirm qall<Return>", opts)

-- Disable Ex mode
map("n", "Q", "<Nop>", opts)

-- toggle and untoggle spell checking
map("n", "<Leader>sp", ":setlocal spell!<Return>", opts)

-- <F9> toggles word wrap
map("n", "<F9>", ":set wrap!<Return>", opts)
map("n", "<F9>", "<ESC>:set wrap!<Return>", opts)

-- Remove crutches in Insert Mode
map("i", "<Left>", "<Nop>", opts)
map("i", "<Right>", "<Nop>", opts)
map("i", "<Down>", "<Nop>", opts)
map("i", "<Up>", "<Nop>", opts)

-- Remove crutches in Normal Mode
map("n", "<Left>", "<Nop>", opts)
map("n", "<Right>", "<Nop>", opts)
map("n", "<Down>", "<Nop>", opts)
map("n", "<Up>", "<Nop>", opts)

-- Remove crutches in Visual Mode
map("v", "<Left>", "<Nop>", opts)
map("v", "<Right>", "<Nop>", opts)
map("v", "<Down>", "<Nop>", opts)
map("v", "<Up>", "<Nop>", opts)
