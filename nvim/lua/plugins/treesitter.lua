return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      compilers = {
        'gcc',
      },
      ensure_installed = {
        'bash',
        'c',
        'cmake',
        'comment',
        'css',
        'fish',
        'go',
        'gomod',
        'hcl',
        'html',
        'javascript',
        'json',
        'jsonc',
        'lua',
        'luadoc',
        'luap',
        'markdown_inline',
        'markdown',
        'python',
        'query',
        'regex',
        'ruby',
        'rust',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
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
        enable = true,
      },
      matchup = {
        enable = true,
      },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      },
      separator = '-',
      sync_install = false,
    },
  },
}
