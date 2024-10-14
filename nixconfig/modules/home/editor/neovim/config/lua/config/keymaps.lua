----------------------------------------------------------------------------
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- Keymaps configuration file: keymaps of neovim
-- GENERAL KEY MAP
-- :map for list mappings.
------------------------------------------------------------------------------
local utils = require('config.util.cmd')
local map = utils.map
local g = utils.g
local opts = {noremap = true}

-- Disable Ex mode
map('n', 'Q', '<Nop>', opts)

-- Get to command mode faster
map('n', ';', ':', opts)
map('v', ';', ':', opts)
map('x', ';', ':', opts)

-- clear search highlighting
map('n', '<leader>c', ':nohl<CR>', opts)

-- map Esc to kk
map('i', 'kk', '<esc>', opts)

-- fast saving
map('n', '<leader>w', ':w<CR>', opts)
map('i', '<leader>w', '<esc>:w<CR>', opts)

-- close all windows and exit from neovim
map('n', '<leader>q', ':qa!<CR>', opts)

-- switch between the last two files
map('n', '<leader><leader>', '<C-^>', opts)

-- Insert completions
map('i', '<c-f>', '<c-x><c-f>', opts)

-- move between buffer
map('n', '<leader>h', '<C-W>h', opts)
map('n', '<leader>l', '<C-W>l', opts)
map('n', '<leader>k', '<C-W>k', opts)
map('n', '<leader>j', '<C-W>j', opts)

-- narrower window
map('n', '<leader>-', '<C-W><', opts)
-- wider window
map('n', '<leader>+', '<C-W>>', opts)
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
map('n', '<leader>]', '>>', opts)
map('n', '<leader>[', '<<', opts)
map('v', '<leader>[', '<gv', opts)
map('v', '<leader>]', '>gv', opts)

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

-- Mighty motions
map('v', 'J', ":m '>+1<CR>gv=gv", opts)
map('v', 'K', ":m '<-2<CR>gv=gv", opts)
