-- Instant scroll configuration
-- This file forces instant PageUp/PageDown scrolling

local M = {}

function M.setup()
  -- Disable any smooth scrolling
  vim.opt.smoothscroll = false
  vim.opt.lazyredraw = true

  -- Create the fastest possible PageUp/PageDown
  -- Using <Cmd> mapping which doesn't trigger screen redraws
  vim.keymap.set({"n", "v", "i"}, "<PageUp>", "<Cmd>lua vim.api.nvim_win_set_cursor(0, {math.max(1, vim.fn.line('.') - vim.fn.winheight(0)), 0})<CR>",
    { desc = "Instant page up", silent = true, noremap = true })

  vim.keymap.set({"n", "v", "i"}, "<PageDown>", "<Cmd>lua vim.api.nvim_win_set_cursor(0, {math.min(vim.fn.line('$'), vim.fn.line('.') + vim.fn.winheight(0)), 0})<CR>",
    { desc = "Instant page down", silent = true, noremap = true })

  -- Also override Ctrl-B and Ctrl-F which are the traditional page movements
  vim.keymap.set({"n", "v"}, "<C-b>", "<Cmd>lua vim.api.nvim_win_set_cursor(0, {math.max(1, vim.fn.line('.') - vim.fn.winheight(0)), 0})<CR>",
    { desc = "Instant page up", silent = true, noremap = true })

  vim.keymap.set({"n", "v"}, "<C-f>", "<Cmd>lua vim.api.nvim_win_set_cursor(0, {math.min(vim.fn.line('$'), vim.fn.line('.') + vim.fn.winheight(0)), 0})<CR>",
    { desc = "Instant page down", silent = true, noremap = true })
end

-- Force the mappings to load after everything else
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.schedule(function()
      M.setup()
    end)
  end,
  desc = "Force instant scroll mappings"
})

return M