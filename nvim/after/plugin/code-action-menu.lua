local status, code_action_menu = pcall(require, 'nvim-code-action-menu')
if (not status) then return end

vim.g.code_action_menu_window_border = 'single'