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
