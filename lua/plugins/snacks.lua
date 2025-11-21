-- Override snacks.nvim to disable animations but keep UI features
return {
  "folke/snacks.nvim",
  opts = {
    notifier = {
      top_down = false, -- place notifications from bottom to top (lower right)
    },
    -- Disable scroll animations
    scroll = {
      enabled = false, -- Completely disable scroll animations
    },
    -- Disable any animation features
    animate = {
      enabled = false,
    },
  },
}