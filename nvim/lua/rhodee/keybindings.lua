------------------------------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- GENERAL KEY MAP
-- :map for list mappings.
------------------------------------------------------------------------------
local utils = require('rhodee.util.cmd')
local map = utils.map
local g = utils.g
local opts = {noremap = true}

g.mapleader = ','

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

-- Git
map("n", "<leader>gs", '<cmd>Git<cr>', opts)

-- Undotree
map("n", "<leader>u", '<cmd>UndotreeToggle<cr>', opts)

-- Telescope
map('n', '<C-p>', '<cmd>Telescope find_files theme=dropdown<cr>', opts)
map('n', '<C-f>', '<cmd>Telescope live_grep theme=dropdown<cr>', opts)
map('n', '<C-b>', '<cmd>Telescope buffers theme=dropdown<cr>', opts)
map('n', '<C-h>', '<cmd>Telescope help_tags theme=dropdown <cr>', opts)
map('n', '<leader>fo', '<cmd>Telescope oldfiles theme=dropdown previewer=false<cr>', opts)

-- Trouble
map('n', '<leader>xx', '<cmd>TroubleToggle<cr>', opts)
map('n', '<leader>xw', '<cmd>Trouble workspace_diagnostics<cr>', opts)
map('n', '<leader>xd', '<cmd>Trouble document_diagnostics<cr>', opts)
map('n', '<leader>xl', '<cmd>Trouble loclist<cr>', opts)

-- NVIM-Tree
map("n", "<leader>n", '<cmd>NvimTreeToggle<cr>', opts)

-- DAP

-- start
map('n', '<leader>dc', '<cmd>DapContinue<cr>', opts)
-- step out
map('n', '<leader>do', '<cmd>DapStepOut<cr>', opts)
-- step into
map('n', '<leader>di', '<cmd>DapStepInto<cr>', opts)
-- step over
map('n', '<leader>dvr', '<cmd>DapStepOver<cr>', opts)
-- toggle breakpoint
map('n', '<leader>db', '<cmd>DapToggleBreakpoint<cr>', opts)
-- set breakpoint expr
map('n', '<leader>dbe', "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", opts)
-- UI
map('n', '<leader>du', "<cmd>lua require('dapui').toggle()<cr>", opts)
-- REPL
map('n', '<leader>db', '<cmd>DapToggleRepl<cr>', opts)
-- end session
map('n', '<leader>dx', '<cmd>DapTerminate<cr>', opts)


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
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
