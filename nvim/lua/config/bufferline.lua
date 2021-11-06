require('bufferline').setup {
  options = {
    diagnostics = 'nvim_lsp',
    numbers = function(opts)
      return string.format("%s", opts.id)
    end,
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'Explorer',
        highlight = 'Directory',
        text_align = 'left'
      }
    }
  }
}
