local status, indent_blankline = pcall(require, 'indent_blankline')
if (not status) then return end

indent_blankline.setup({
  char = '|',
  show_current_context = true,
  use_treesitter = true,
})

