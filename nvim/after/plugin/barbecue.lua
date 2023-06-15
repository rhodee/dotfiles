local status, barbecue = pcall(require, 'barbecue')
if (not status) then return end

barbecue.setup({
    opts = {
      theme = vim.g.active_color_scheme,
    },
})

require('barbecue.ui').toggle(true)