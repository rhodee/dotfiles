local telescope = require("telescope")

telescope.setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--hidden',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--ignore-file',
    },
    layout_config = {
      horizontal = {
        height = 0.8,
        width = 0.8
      }
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "closest",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    file_sorter = require "telescope.sorters".get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
    path_display = absolute,
    winblend = 0,
    border = {},
    borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
    color_devicons = false,
    use_less = true,
    set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
    file_previewer = require "telescope.previewers".vim_buffer_cat.new,
    grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
    qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
    pickers = {
      find_files = {
        find_command = {
          'rg',
          '--hidden',
          '--no-heading',
          '--with-filename',
          '--files',
          '--column',
          '--smart-case',
          '--ignore-file',
          '--iglob',
          '!.git',
        },
        on_input_filter_cb = function(prompt)
          local result = vim.split(prompt, ' ')
          if #result == 2 then
            return { prompt = result[2] .. '.' .. result[1] }
          else
            return { prompt = prompt }
          end
        end,
      },
      oldfiles = {
        only_cwd = true,
        file_ignore_patterns = {
          'COMMIT_EDITMSG',
        },
      },
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({}),
    },
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case"
    }
  }
}

-- load extensions after calling setup function
require("telescope").load_extension("fzf")