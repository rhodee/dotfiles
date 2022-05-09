require('nvim-tree').setup({
  hijack_unnamed_buffer_when_opening = true,
  view = {
    width = 40,
  },
  filters = {
    dotfiles = false,
  },
})
