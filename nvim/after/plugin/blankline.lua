local status, indent_blankline = pcall(require, 'indent_blankline')
if (not status) then return end

local enable_indent_filetype = {
  'go',
  'lua',
  'sh',
  'rust',
  'cpp',
  'typescript',
  'typescriptreact',
  'javascript',
  'json',
  'python',
  'sql',
}

indent_blankline.setup({
  char = '|',
  ft = enable_indent_filetype,
  show_current_context = true,
  use_treesitter = true,
})

