local status, nightfox = pcall(require, 'nightfox')
if not status then return end

-- Set colorscheme
if vim.fn.has('termguicolors') == 1 then
    vim.o.termguicolors = true
end

nightfox.setup({
    options = {
        dim_inactive = true,
        styles = {
            comments = 'italic',
            keywords = 'bold',
            types = 'italic,bold',
        },
    },
})

vim.g.active_color_scheme = 'nightfox'

vim.cmd([[colorscheme nordfox]])