local nvim_tree = require("nvim-tree")

nvim_tree.setup({
  view = {
    width = 25,
  },
  filters = {
    dotfiles = false,
    custom = { 'node_modules' },
  },
})
