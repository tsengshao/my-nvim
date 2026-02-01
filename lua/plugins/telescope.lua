-- =========================================================
-- Project search: telescope + ripgrep
-- =========================================================
return {
  "nvim-telescope/telescope.nvim",
  version = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },

  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",

        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
          width = 0.95,
          height = 0.90,
          preview_cutoff = 1, -- always show preview
        },

        path_display = { "filename_first" },

        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    pcall(telescope.load_extension, "fzf")

    -- Keymaps
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep (project)" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers,   { desc = "Buffers" })
  end,
}
