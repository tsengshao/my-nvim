-- =========================================================
-- File tree: neo-tree
-- =========================================================
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },

  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",

      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = true,
        },
      },

      window = {
        width = 20, -- your "narrow tree"
        mappings = {
          ["l"] = "open",
          ["h"] = "close_node",
        },
      },
    })

    vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "File tree" })
  end,
}
