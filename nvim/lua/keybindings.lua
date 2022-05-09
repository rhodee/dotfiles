------------------------------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- GENERAL KEY MAP
-- :map for list mappings.
------------------------------------------------------------------------------
local map = vim.api.nvim_set_keymap
local opts = {noremap = true}
local g = vim.g

g.mapleader = ' '
g.maplocalleader = ','

-- clear search highlighting
map('n', '<Leader>c', ':nohl<CR>', opts)

-- map Esc to kk
map('i', 'kk', '<esc>', opts)

-- fast saving
map('n', '<Leader>w', ':w<CR>', opts)
map('i', '<Leader>w', '<esc>:w<CR>', opts)

-- close all windows and exit from neovim
map('n', '<Leader>q', ':qa!<CR>', opts)

-- Telescope
map('n', '<C-p>', '<cmd>Telescope find_files theme=dropdown<cr>', opts)
map('n', '<C-f>', '<cmd>Telescope live_grep theme=dropdown<cr>', opts)
map('n', '<C-b>', '<cmd>Telescope buffers theme=dropdown<cr>', opts)
map('n', '<C-h>', '<cmd>Telescope help_tags theme=dropdown <cr>', opts)
map('n', '<leader>fa', '<cmd>Telescope find_files theme=dropdown follow=true no_ignore=true hidden=true<cr>', opts)
map('n', '<leader>cm', '<cmd>Telescope git_commits theme=dropdown<cr>', opts)
map('n', '<leader>gt', '<cmd>Telescope git_status theme=dropdown<cr>', opts)
map('n', '<leader>fh', '<cmd>Telescope help_tags theme=dropdown<cr>', opts)
map('n', '<leader>fo', '<cmd>Telescope oldfiles theme=dropdown previewer=false<cr>', opts)
map('n', '<leader>th', '<cmd>Telescope themes theme=dropdown<cr>', opts)
map('n', '<leader>tk', '<cmd>Telescope keymaps theme=dropdown<cr>', opts)
map('n', '<leader>sc', '<cmd>Telescope command_history theme=dropdown previewer=false<cr>', opts)
map('n', '<leader>sm', '<cmd>Telescope marks<cr>', opts)

-- Insert completions
map('i', '<c-f>', '<c-x><c-f>', opts)

-- Hop.
map('', '<leader>/', '<cmd>HopPattern<cr>', opts)

-- Terminal
map('n', '<C-t>', ':Term<CR>', { noremap = true })

-- Get to command mode faster
map('n', ';', ':', opts)
map('v', ';', ':', opts)
map('x', ';', ':', opts)

-- jump to start and end of line
map('n', 'H', '^', opts)
map('n', 'L', '$', opts)

-- clear search highlights
map('n', '<Leader><Return>', ':noh<Return>', opts)

-- switch between the last two files
map('n', '<Leader><Leader>', '<C-^>', opts)

-- Tree
map('n', '<C-n>', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>n', ':NvimTreeFocus<CR>', opts)

-- move between buffer
map('n', '<Leader>h', '<C-W>h', opts)
map('n', '<Leader>l', '<C-W>l', opts)
map('n', '<Leader>k', '<C-W>k', opts)
map('n', '<Leader>j', '<C-W>j', opts)

-- narrower window
map('n', '<Leader>-', '<C-W><', opts)
-- wider window
map('n', '<Leader>+', '<C-W>>', opts)
-- shorter window
map('n', '-', '<C-W>-', opts)
-- taller window
map('n', '+', '<C-W>+', opts)

-- Open new splits easily
map('n', 'vv', '<C-W>v', opts)
map('n', 'ss', '<C-W>s', opts)
map('n', 'sq', '<C-W>q', opts)

-- more natural movement with wrap on
map('n', 'j', 'gj', opts)
map('n', 'k', 'gk', opts)
map('v', 'j', 'gj', opts)
map('v', 'k', 'gk', opts)

-- indent like ST2
map('n', '<Leader>]', '>>', opts)
map('n', '<Leader>[', '<<', opts)
map('v', '<Leader>[', '<gv', opts)
map('v', '<Leader>]', '>gv', opts)

-- Paste with current indentation
map('n', '<Leader>p', ']p', opts)

-- Disable Ex mode
map('n', 'Q', '<Nop>', opts)

-- toggle and untoggle spell checking
map('n', '<Leader>sp', ':setlocal spell!<Return>', opts)

-- <F9> toggles word wrap
map('n', '<F9>', ':set wrap!<Return>', opts)
map('n', '<F9>', '<esc>:set wrap!<Return>', opts)

-- Remove crutches in Insert Mode
map('i', '<Left>', '<Nop>', opts)
map('i', '<Right>', '<Nop>', opts)
map('i', '<Down>', '<Nop>', opts)
map('i', '<Up>', '<Nop>', opts)

-- Remove crutches in Normal Mode
map('n', '<Left>', '<Nop>', opts)
map('n', '<Right>', '<Nop>', opts)
map('n', '<Down>', '<Nop>', opts)
map('n', '<Up>', '<Nop>', opts)

-- Remove crutches in Visual Mode
map('v', '<Left>', '<Nop>', opts)
map('v', '<Right>', '<Nop>', opts)
map('v', '<Down>', '<Nop>', opts)
map('v', '<Up>', '<Nop>', opts)
