return {
  {
    'stevearc/aerial.nvim',
    opts = {
      layout = {
        default_direction = 'prefer_right',
      },
    },
    keys = {
      { '<leader>a', '<cmd>AerialToggle!<CR>', desc = 'Toggle aerial code view' },
    },
  }
}

