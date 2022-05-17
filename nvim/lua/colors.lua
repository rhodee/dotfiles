local cmd = vim.cmd
local g = vim.g
local o, g = vim.o, vim.g

cmd('filetype plugin indent on')

g.t_Co = 256
g.base16colorspace = 256
o.termguicolors = true

-- Colorschemes

-- Gruvbox Medium

g.gruvbox_bold = 1
g.gruvbox_italic = 1
g.gruvbox_underline = 1
g.gruvbox_undercurl = 1
g.gruvbox_contrast_dark = "medium"
g.gruvbox_italicize_comments = 1

-- Load the colorscheme
cmd([[colorscheme gruvbox]])

-- Nord
-- g.nord_contrast = true
-- g.nord_borders = false
-- g.nord_disable_background = false
-- g.nord_italic = false

-- Load the colorscheme
-- require('nord').set()
-- cmd([[colorscheme nord]])