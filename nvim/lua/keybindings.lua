------------------------------------------------------------------------------
-- GENERAL KEY MAP
-- :map for list mappings.
------------------------------------------------------------------------------

local map = vim.api.nvim_set_keymap
local opts = {noremap = true}
local g = vim.g

map("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = " "

-- Telescope
map("n", "<leader>f", ":Telescope live_grep<Return>", opts)
map("n", "<C-p>", ":lua require('telescope.builtin').git_files()<Return>", opts)
map("n", "<leader>gs", ":Telescope git_files<Return>", opts)

-- Completion


-- Nvim-Tree
map("n", "<C-n>", ":lua require('nvim-tree').toggle()<Return>", opts)

map("n", ";", ":", opts)


-- jump to start and end of line
map("n", "H", "^", opts)
map("n", "L", "$", opts)

-- clear search highlights
map("n", "<Leader><Return>", ":noh<Return>", opts)

-- switch between the last two files
map("n", "<Leader><Leader>", "<C-^>", opts)

-- Fast saving
map("n", "<Leader>w", "w!<Return>", opts)

-- move between buffer
map("n", "<Leader>h", "<C-W>h", opts)
map("n", "<Leader>l", "<C-W>l", opts)
map("n", "<Leader>k", "<C-W>k", opts)
map("n", "<Leader>j", "<C-W>j", opts)

-- narrower window
map("n", "-", "<C-W><", opts)
-- wider window
map("n", "-", "<C-W>>", opts)
-- shorter window
map("n", "-", "<C-W>-", opts)
-- taller window
map("n", "-", "<C-W>+", opts)

-- Open new splits easily
map("n", "sv", "<C-W>v", opts)
map("n", "ss", "<C-W>s", opts)
map("n", "sq", "<C-W>q", opts)

-- indent like ST2
map("n", "<Leader>]", ">>", opts)
map("n", "<Leader>[", "<<", opts)
map("v", "<Leader>[", "<gv", opts)
map("v", "<Leader>]", ">gv", opts)

-- Tabs
-- opens a new tab with the current buffer's path
map("n", "<Leader>to", ":tabonly<Return>", opts)
map("n", "<Leader>tc", ":tabclose<Return>", opts)
map("n", "<Leader>tn", ":tabnext<Return>", opts)
map("n", "<Leader>tp", ":tabprevious<Return>", opts)
map("n", "<Leader>t", ":tabnew<Return>", opts)

-- Buffer
map("n", "<Leader>bn", ":bnext<Return>", opts)
map("n", "<Leader>bp", ":bprevious<Return>", opts)
map("n", "<Leader>bf", ":bfirst<Return>", opts)
map("n", "<Leader>bd", ":bdelete<Return>", opts)

-- Back to last position
map("n", "<C-b>", "<C-o>", opts)

-- Paste with current indentation
map("n", "<Leader>p", "]p", opts)

-- command! Qall qall
-- Bind :Q to :q
-- command! Q q
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
