local status, codewindow = pcall(require, 'codewindow')
if (not status) then return end

codewindow.setup({})
