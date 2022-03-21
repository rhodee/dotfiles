local cmd = vim.cmd
local g = vim.g
local o, g = vim.o, vim.g


g.t_Co = 256
g.base16colorspace = 256
o.termguicolors = true
o.background = "dark" -- or "light" for light mode

g.gruvbox_bold = 1
g.gruvbox_italic = 1
g.gruvbox_underline = 1
g.gruvbox_undercurl = 1
g.gruvbox_contrast_dark = "medium"
g.gruvbox_italicize_comments = 1

cmd('filetype plugin indent on')
cmd([[colorscheme gruvbox]])