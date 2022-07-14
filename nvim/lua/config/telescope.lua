local telescope = require('telescope')
local actions = require('telescope.actions')
local trouble = require('trouble.providers.telescope')

telescope.setup({
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--hidden',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },
    mappings = {
      i = {
        ['<C-t>'] = trouble.open_with_trouble,
        ['<C-u>'] = false, -- clear prompt with ctrl+u
        ['<C-d>'] = actions.preview_scrolling_down,
        ['<C-f>'] = actions.preview_scrolling_up,
    },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
    borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
    initial_mode = 'insert',
    prompt_prefix = "🔍 ",
    selection_caret = "> ",
    use_less = true,
    set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
    file_sorter = require('telescope.sorters').get_fuzzy_file,
    file_ignore_patterns = { 'node_modules', 'vendor' },
    generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
  },
  extensions = {
    file_browser = {
      hidden = true,
      no_ignore = true,
      previewer = false,
      layout_strategy = 'vertical',
      layout_config = {
        vertical = {
          prompt_position = 'bottom',
          width = 0.4,
          height = 0.6,
        },
      },
    },
    fzf = {
      fuzzy  = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})

-- load extensions after calling setup function
telescope.load_extension('fzf')
telescope.load_extension('ui-select')
telescope.load_extension('file_browser')
telescope.load_extension('dap')

