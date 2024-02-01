return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<C-p>", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
      { "<C-g>", "<cmd>Telescope live_grep<CR>", desc = "Grep Files" },
    },
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
}
