local status, _ = pcall(require, 'nvim-treesitter')
if (not status) then return end

require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'bash',
    'c',
    'cmake',
    'comment',
    'css',
    'fish',
    'go',
    'gomod',
    'graphql',
    'help',
    'hcl',
    'html',
    'javascript',
    'json',
    'jsonc',
    'lua',
    'python',
    'regex',
    'ruby',
    'rust',
    'toml',
    'tsx',
    'typescript',
    'yaml',
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
  fold = {
    enable = true,
  },
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
  },
  indent = {
    enable = true
  },
  matchup = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 1500,
  },
  separator = '-',
  sync_install = false,
}
