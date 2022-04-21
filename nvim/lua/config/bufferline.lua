local bufferline = require("bufferline")

bufferline.setup({
  options = {
    max_name_length = 24,
    close_command = 'Bdelete %d',
  },
})
