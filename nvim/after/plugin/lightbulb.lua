local utils = require('rhodee.util.cmd')
local autocmd = utils.autocmd


vim.cmd([[
    autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()
]])
