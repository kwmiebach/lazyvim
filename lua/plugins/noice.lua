-- Override noice.nvim popup positions to bottom area
return {
  "folke/noice.nvim",
  opts = {
    -- Disable scroll-related features that interfere with performance
    health = {
      checker = false, -- Disable health checks including lazyredraw warning
    },
    presets = {
      bottom_search = false, -- Don't move search to bottom
      long_message_to_split = false, -- Don't redirect long messages
    },
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