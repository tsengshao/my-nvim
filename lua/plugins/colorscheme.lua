-- =========================================================
-- Colorscheme (two profiles)
-- Profile A: truecolor + catppuccin-mocha
-- Profile B: no termguicolors + builtin colorscheme (vim-like)
-- Also: set ibl indent/scope highlight to gray in both profiles
-- =========================================================

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,

  config = function()
    -- ---------------------------------------------------------
    -- State
    -- theme_profile:
    --   "A" -> termguicolors + catppuccin-mocha
    --   "B" -> no termguicolors + builtin colorscheme (default)
    -- ---------------------------------------------------------
    if vim.g.theme_profile == nil then
      vim.g.theme_profile = "B"
    end

    -- You already use this for catppuccin transparency
    if vim.g.transparent_enabled == nil then
      vim.g.transparent_enabled = true
    end

    local function set_split_separator_grey()
      -- Theme B: vim-like, subtle separators
      vim.api.nvim_set_hl(0, "WinSeparator", { ctermfg = 250, bg = "NONE", })
      vim.api.nvim_set_hl(0, "VertSplit",   { ctermfg = 250, bg = "NONE", })
    end
    -- Treesitter variables: white, no bold (vim-like)
    local function set_ts_variables_white()
      local use_truecolor = vim.opt.termguicolors:get()
    
      local hl = use_truecolor
        and { fg = "#ffffff", bold = false }
        or  { ctermfg = 15, bold = false }
    
      -- Base variables
      vim.api.nvim_set_hl(0, "@variable", hl)
      vim.api.nvim_set_hl(0, "@variable.member", hl)
      -- Lua-specific (optional but explicit)
      vim.api.nvim_set_hl(0, "@variable.lua", hl)
      vim.api.nvim_set_hl(0, "@variable.member.lua", hl)
      -- Properties (THIS is the missing piece)
      vim.api.nvim_set_hl(0, "@property", hl)
      vim.api.nvim_set_hl(0, "@property.lua", hl)
      -- Functions (name)
      vim.api.nvim_set_hl(0, "@function", hl)
      vim.api.nvim_set_hl(0, "@function.lua", hl)
    end

    -- ---------------------------------------------------------
    -- IBL highlight: gray indent / scope
    -- - For truecolor: use fg hex
    -- - For non-truecolor: use ctermfg gray (0-255 palette)
    -- ---------------------------------------------------------
    local function set_ibl_gray()
      local use_truecolor = vim.opt.termguicolors:get()

      if use_truecolor then
        -- Truecolor gray (adjust if you want brighter/darker)
        vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3a3a3a", nocombine = true })
        vim.api.nvim_set_hl(0, "IblScope",  { fg = "#5a5a5a", nocombine = true })
      else
        -- 256-color gray (cterm)
        vim.api.nvim_set_hl(0, "IblIndent", { ctermfg = 238, nocombine = true })
        vim.api.nvim_set_hl(0, "IblScope",  { ctermfg = 244, nocombine = true })
      end
    end

    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        if vim.g.theme_profile == "B" then
          set_ibl_gray()
          set_ts_variables_white()
          set_split_separator_grey()
        end
      end,
    })

    -- ---------------------------------------------------------
    -- Apply profile A / B
    -- ---------------------------------------------------------
    local function apply_profile()
      if vim.g.theme_profile == "A" then
        -- Profile A: truecolor + catppuccin
        vim.opt.termguicolors = true

        require("catppuccin").setup({
          transparent_background = vim.g.transparent_enabled,
          float = {
            transparent = true,
          },
        })
        vim.cmd.colorscheme("catppuccin-mocha")

      else
        -- Profile B: no termguicolors + builtin vim-like scheme
        vim.opt.termguicolors = false

        -- Pick ONE:
        vim.cmd.colorscheme("vim")
        -- Apply indent gray immediately
        set_ibl_gray()
        set_ts_variables_white()
        set_split_separator_grey()
      end

    end

    -- Apply once on startup
    apply_profile()

    -- ---------------------------------------------------------
    -- Keymaps
    -- ---------------------------------------------------------

    -- Toggle transparent background (only meaningful in profile A)
    vim.keymap.set("n", "<leader>tt", function()
      vim.g.transparent_enabled = not vim.g.transparent_enabled
      -- Re-apply current profile to update catppuccin config
      apply_profile()
    end, { desc = "Toggle transparent background" })

    -- Toggle theme profile A <-> B
    vim.keymap.set("n", "<leader>tc", function()
      vim.g.theme_profile = (vim.g.theme_profile == "A") and "B" or "A"
      apply_profile()
    end, { desc = "Toggle theme profile (A/B)" })
  end,
}
