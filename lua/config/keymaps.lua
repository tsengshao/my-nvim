-- =========================================================
-- Keymaps
-- =========================================================
local map = vim.keymap.set

-- Toggle line numbers
map("n", "<leader>n", function()
  vim.opt.number = not vim.opt.number:get()
end, { desc = "Toggle number" })

map("n", "<leader>r", function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = "Toggle relativenumber" })

-- Fast vertical resize (step = 5 columns)
-- Note: keep it close to vim's <C-w> family
map("n", "<C-w>,", "<cmd>vertical resize +5<CR>", { desc = "VResize +5" })
map("n", "<C-w>.", "<cmd>vertical resize -5<CR>", { desc = "VResize -5" })

-- =========================================================
-- Window navigation (leader-based)
-- =========================================================
-- Move to left window (file tree)
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Focus left window" })
-- Move to right window (editor)
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Focus right window" })
