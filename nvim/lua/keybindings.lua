------------------------------------------------------------------------------
-- GENERAL KEY MAP
-- :map for list mappings.
------------------------------------------------------------------------------

local map = vim.api.nvim_set_keymap
local opts = {noremap = true}
local g = vim.g

map("n", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = " "

-- Telescope
map("n", "<C-f>", ":Telescope live_grep<Return>", opts)
map("n", "<C-p>", ":lua require('telescope.builtin').git_files()<Return>", opts)
map("n", "<Leader>gs", ":Telescope git_files<Return>", opts)

-- DAP
map("n", "<Leader>bp", ":lua require('dap').toggle_breakpoint()<Return>", opts)
map("n", "<Leader>dap", ":lua require('dap').continue()<Return>", opts)
map("n", "<Leader>dui", ":lua require('dap').toggle()<Return>", opts)

-- ALE
map("n", "<Leader>rn", ":ALERename<Return>", opts)


-- Nvim-Tree
map("n", "<Leader>n", ":lua require('nvim-tree').toggle()<Return>", opts)

map("n", ";", ":", opts)


-- jump to start and end of line
map("n", "H", "^", opts)
map("n", "L", "$", opts)

-- clear search highlights
map("n", "<Leader><Return>", ":noh<Return>", opts)

-- switch between the last two files
map("n", "<Leader><Leader>", "<C-^>", opts)

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
