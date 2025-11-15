-- Override noice.nvim command line popup position to bottom
return {
  "folke/noice.nvim",
  opts = {
    views = {
      cmdline_popup = {
        position = {
          row = "90%", -- Position near bottom of screen
          col = "50%", -- Keep centered horizontally
        },
      },
      cmdline_popupmenu = {
        position = {
          row = "80%", -- Position the popup menu above the cmdline
          col = "50%",
        },
      },
    },
  },
}