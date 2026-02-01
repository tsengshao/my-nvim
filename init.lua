-- =========================================================
-- Neovim entry point
-- - Load options
-- - Load keymaps
-- - Bootstrap lazy.nvim
-- - Load plugins
-- =========================================================

require("config.options")
require("config.keymaps")

-- ---------------------------------------------------------
-- lazy.nvim bootstrap
-- ---------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ---------------------------------------------------------
-- plugins
-- ---------------------------------------------------------
require("lazy").setup(require("plugins"), {
  ui = { border = "rounded" },
})
