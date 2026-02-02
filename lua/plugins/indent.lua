-- =========================================================
-- indent.lua
-- Indent guides (indent-blankline / ibl)
-- - Global on/off toggle
-- - Theme-independent
-- =========================================================

return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "VeryLazy",

  config = function()
    -- -----------------------------------------------------
    -- State
    -- -----------------------------------------------------
    if vim.g.ibl_enabled == nil then
      vim.g.ibl_enabled = true
    end

    local ibl = require("ibl")

    -- -----------------------------------------------------
    -- Apply IBL according to state
    -- -----------------------------------------------------
    local function apply_ibl()
      ibl.setup({
        enabled = vim.g.ibl_enabled,
        indent = {
          char = "│",
        },
        scope = {
          enabled = true,
        },
      })
    end

    -- Initial apply
    apply_ibl()

    -- -----------------------------------------------------
    -- Keymap: toggle IBL
    -- -----------------------------------------------------
    vim.keymap.set("n", "<leader>ti", function()
      vim.g.ibl_enabled = not vim.g.ibl_enabled
      apply_ibl()
    end, { desc = "Toggle indent guides (IBL)" })

    -- -----------------------------------------------------
    -- Re-apply after colorscheme change
    -- (colorscheme may reset highlights)
    -- -----------------------------------------------------
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        apply_ibl()
      end,
    })
  end,
}
