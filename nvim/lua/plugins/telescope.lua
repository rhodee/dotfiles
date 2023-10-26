return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
      },
    },
    keys = {
      { "<C-p>", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
      { "<C-g>", "<cmd>Telescope live_grep<CR>",  desc = "Grep Files" },
    },
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build =
      "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
}
