-- =========================================================
-- Basic options (vimrc-like)
-- =========================================================

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- UI
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.termguicolors = true
vim.opt.laststatus = 0

-- No mouse (uncomment if you want fully keyboard-only)
vim.opt.mouse = ""

-- System clipboard (macOS / Linux with clipboard support)
-- vim.opt.clipboard = "unnamedplus"

-- Indent
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Search behavior (recommended)
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Restore cursor position when reopening files
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)

    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
