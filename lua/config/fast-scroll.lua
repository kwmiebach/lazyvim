-- Ultra-fast scrolling implementation
-- Bypasses all UI plugins and animations

local M = {}

-- Store original values
local original_mappings = {}

function M.instant_page_up()
  -- Disable all UI updates during scroll
  local eventignore = vim.o.eventignore
  vim.o.eventignore = "all"

  local view = vim.fn.winsaveview()
  local height = vim.api.nvim_win_get_height(0)
  view.lnum = math.max(1, view.lnum - height)
  view.topline = math.max(1, view.topline - height)
  vim.fn.winrestview(view)

  -- Re-enable events
  vim.o.eventignore = eventignore
end

function M.instant_page_down()
  -- Disable all UI updates during scroll
  local eventignore = vim.o.eventignore
  vim.o.eventignore = "all"

  local view = vim.fn.winsaveview()
  local height = vim.api.nvim_win_get_height(0)
  local last_line = vim.fn.line('$')
  view.lnum = math.min(last_line, view.lnum + height)
  view.topline = math.min(last_line, view.topline + height)
  vim.fn.winrestview(view)

  -- Re-enable events
  vim.o.eventignore = eventignore
end

function M.setup()
  -- Remove lazyredraw as it conflicts with Noice
  vim.opt.smoothscroll = false

  -- Map directly to our functions with highest priority
  vim.keymap.set({'n', 'v', 'x', 'o'}, '<PageUp>', M.instant_page_up,
    { desc = 'Ultra-fast page up', noremap = true, silent = true })

  vim.keymap.set({'n', 'v', 'x', 'o'}, '<PageDown>', M.instant_page_down,
    { desc = 'Ultra-fast page down', noremap = true, silent = true })

  -- Also map Ctrl-B and Ctrl-F
  vim.keymap.set({'n', 'v', 'x', 'o'}, '<C-b>', M.instant_page_up,
    { desc = 'Ultra-fast page up', noremap = true, silent = true })

  vim.keymap.set({'n', 'v', 'x', 'o'}, '<C-f>', M.instant_page_down,
    { desc = 'Ultra-fast page down', noremap = true, silent = true })
end

-- Override after ALL plugins have loaded
vim.api.nvim_create_autocmd('User', {
  pattern = 'VeryLazy',
  callback = function()
    -- Wait a bit more to ensure everything is loaded
    vim.defer_fn(function()
      M.setup()
    end, 100)
  end,
})

return M