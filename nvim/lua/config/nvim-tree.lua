local g = vim.g
-- local cmd = vim.cmd
-- Open NvimTree on Vim open.
-- vim.cmd [[autocmd VimEnter * NvimTreeOpen]]

g.nvim_tree_window_picker_exclude = {
  filetype = {
    "notify",
    "packer",
    "qf"
  },
  buftype = {
    "terminal"
  }
}

-- show indent markets when folder is open
g.nvim_tree_indent_markers = 1
-- highlight files/dirs.
g.nvim_tree_highlight_opened_files = 0
-- Append trailing slash to folder names
g.nvim_tree_add_trailing = 0

require "nvim-tree".setup {
  tree_ignore = {".git", "node_modules", ".cache", "vendor"},
  -- closes neovim automatically when the tree is the last **WINDOW** in the view
  auto_close = true,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  update_cwd = true,
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable = true,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd = true,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {}
  },
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd = nil,
    -- the command arguments as a list
    args = {}
  },
  view = {
    -- width of the window, can be either a number (columns) or a string in `%`
    width = "25%",
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = "left",
    -- if true the tree will resize itself after opening a file
    auto_resize = false,
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      -- list of mappings to set on the tree manually
      list = {}
    }
  }
}