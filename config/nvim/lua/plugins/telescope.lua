return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      local actions = require("telescope.actions")

      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["<tab>"] = actions.file_tab,
              ["\\"] = actions.file_vsplit,
              ["<Bar>"] = actions.file_split,
            },
          },
        },
      })
    end,
    keys = {
      { "<C-p>",      "<cmd>Telescope find_files<cr>" },
      { "<leader>pf", "<cmd>Telescope git_files<cr>" },
      { "<leader>pl", "<cmd>Telescope live_grep<cr>" },
    },
    build = function()
      require("telescope").load_extension("fzf")
    end,
  },
}
