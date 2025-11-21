-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"

-- Disable smooth scrolling for instant scrolling
vim.opt.smoothscroll = false

-- Performance optimizations for faster scrolling
-- vim.opt.lazyredraw = true -- Disabled: conflicts with Noice.nvim
vim.opt.redrawtime = 100 -- Time in milliseconds for redrawing the display
vim.opt.updatetime = 100 -- Faster completion and better user experience
vim.opt.timeout = true
vim.opt.timeoutlen = 300 -- Faster key sequence completion
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 10 -- Make escape key more responsive

-- Additional performance settings for instant scrolling
vim.opt.ttyfast = true -- Assume fast terminal connection
vim.opt.scrolljump = 5 -- Lines to scroll when cursor leaves screen
vim.opt.scrolloff = 3 -- Minimum lines to keep above/below cursor
vim.opt.sidescrolloff = 5 -- Minimum columns to keep left/right of cursor

-- Disable concealment globally - show all text as-is
vim.opt.conceallevel = 0
vim.opt.concealcursor = ""

-- Custom hybrid line numbers: absolute for ±3 lines around cursor with color
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "BufEnter", "WinEnter" }, {
  callback = function()
    if vim.opt.relativenumber:get() then
      -- Use a Lua function to build the statuscolumn
      vim.opt.statuscolumn = "%!v:lua.MyStatusColumn()"
    end
  end,
})

-- Define the statuscolumn function
function MyStatusColumn()
  local is_absolute = math.abs(vim.v.relnum) <= 3
  local hl = is_absolute and "%#LineNrAbsolute#" or "%#LineNr#"
  local num = vim.v.relnum == 0 and vim.v.lnum or (is_absolute and vim.v.lnum or vim.v.relnum)
  return hl .. num .. "%=%s "
end

-- Define highlight for absolute line numbers (bright cyan, bold)
vim.api.nvim_set_hl(0, "LineNrAbsolute", { fg = "#00ffff", bold = true })
