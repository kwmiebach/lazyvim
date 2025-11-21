-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Optimize PageUp/PageDown for instant scrolling without intermediate redraws
-- Using Ctrl-U/D with full page counts for faster response
vim.keymap.set({"n", "v"}, "<PageUp>", "<C-U><C-U>", { desc = "Page up fast", silent = true, noremap = true })
vim.keymap.set({"n", "v"}, "<PageDown>", "<C-D><C-D>", { desc = "Page down fast", silent = true, noremap = true })

-- Alternative: Use direct line jumping for even faster response
-- This jumps exactly one screen height without any animation
vim.keymap.set({"n", "v"}, "<S-PageUp>", function()
  local lines = vim.fn.winheight(0)
  vim.cmd("normal! " .. lines .. "k")
end, { desc = "Jump page up", silent = true, noremap = true })

vim.keymap.set({"n", "v"}, "<S-PageDown>", function()
  local lines = vim.fn.winheight(0)
  vim.cmd("normal! " .. lines .. "j")
end, { desc = "Jump page down", silent = true, noremap = true })
