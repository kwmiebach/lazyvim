-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"

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
