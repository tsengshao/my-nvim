-- =========================================================
-- Colorscheme: catppuccin
-- =========================================================
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,

  config = function()
    -- Keep a global flag so we can toggle later
    if vim.g.transparent_enabled == nil then
      vim.g.transparent_enabled = true
    end

    local function apply_catppuccin()
      require("catppuccin").setup({
        transparent_background = vim.g.transparent_enabled,
        float = {
          transparent = true,
        },
      })
      vim.cmd.colorscheme("catppuccin-mocha")
    end

    apply_catppuccin()

    -- Toggle transparent background
    vim.keymap.set("n", "<leader>tt", function()
      vim.g.transparent_enabled = not vim.g.transparent_enabled
      apply_catppuccin()
    end, { desc = "Toggle transparent background" })
  end,
}
