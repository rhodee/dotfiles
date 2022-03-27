local zen = require("zen-mode")

zen.setup({
  window = {
    options = {
      number = true, -- keep number column
      relativenumber = true, -- keep relative numbers
    },
  },
  plugins = {
    options = {
      enabled = true,
      showcmd = true,
    },
    twilight = { enabled = true },
    gitsigns = { enabled = true },
    tmux = { enabled = true },
  },
  -- callback where you can add custom code when the Zen window opens
  on_open = function(win)
  end,
  -- callback where you can add custom code when the Zen window closes
  on_close = function()
  end,
})