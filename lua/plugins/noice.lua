-- Override noice.nvim popup positions to bottom area
return {
  "folke/noice.nvim",
  opts = {
    views = {
      -- Confirmation dialogs (y/n/cancel)
      confirm = {
        position = {
          row = "85%", -- Position near bottom of screen
          col = "50%", -- Keep centered horizontally
        },
      },
      -- Command line popup
      cmdline_popup = {
        position = {
          row = "90%", -- Position near bottom of screen
          col = "50%", -- Keep centered horizontally
        },
      },
      -- Command line popup menu
      cmdline_popupmenu = {
        position = {
          row = "80%", -- Position the popup menu above the cmdline
          col = "50%",
        },
      },
    },
  },
}