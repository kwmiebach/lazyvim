-- Override snacks.nvim notification position to lower right
return {
  "folke/snacks.nvim",
  opts = {
    notifier = {
      top_down = false, -- place notifications from bottom to top (lower right)
    },
  },
}