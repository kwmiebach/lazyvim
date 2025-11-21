-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Optimize PageUp/PageDown for instant scrolling without intermediate redraws
-- Use direct cursor positioning for true instant jump
vim.keymap.set({"n", "v"}, "<PageUp>", function()
  local current_line = vim.fn.line('.')
  local win_height = vim.fn.winheight(0)
  local target_line = math.max(1, current_line - win_height)
  vim.api.nvim_win_set_cursor(0, {target_line, 0})
end, { desc = "Jump page up instantly", silent = true, noremap = true })

vim.keymap.set({"n", "v"}, "<PageDown>", function()
  local current_line = vim.fn.line('.')
  local win_height = vim.fn.winheight(0)
  local last_line = vim.fn.line('$')
  local target_line = math.min(last_line, current_line + win_height)
  vim.api.nvim_win_set_cursor(0, {target_line, 0})
end, { desc = "Jump page down instantly", silent = true, noremap = true })

-- Alternative: Using Ctrl-U/D with full page counts
vim.keymap.set({"n", "v"}, "<S-PageUp>", "<C-U><C-U>", { desc = "Page up alt", silent = true, noremap = true })
vim.keymap.set({"n", "v"}, "<S-PageDown>", "<C-D><C-D>", { desc = "Page down alt", silent = true, noremap = true })
