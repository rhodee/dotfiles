local zen = require("zen-mode")

zen.setup({
  window = {
    width = .85 -- width will be 85% of the editor width
  },
  plugins = {
    options = {
      enabled = true,
      ruler = true, -- enable the ruler text in the cmd line area
      showcmd = true, -- enable the command in the last line of the screen
    },
    twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
    gitsigns = { enabled = false }, -- disables git signs
  }
})
