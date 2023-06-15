local status, indent_blankline = pcall(require, 'indent_blankline')
if (not status) then return end

local enable_indent_filetype = {
  'cpp',
  'go',
  'javascript',
  'json',
  'lua',
  'python',
  'rust',
  'sh',
  'sql',
  'typescript',
  'typescriptreact',
}

indent_blankline.setup({
  char = '|',
  ft = enable_indent_filetype,
  show_current_context = true,
  use_treesitter = true,
})

