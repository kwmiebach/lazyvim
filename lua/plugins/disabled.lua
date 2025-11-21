-- Disable plugins that cause scrolling animations and UI issues
return {
  -- DISABLE NOICE - This completely changes Neovim's UI and adds animations
  -- This is the MAIN CULPRIT for slow scrolling!
  { "folke/noice.nvim", enabled = false },

  -- DISABLE FLASH - Adds visual effects when jumping
  { "folke/flash.nvim", enabled = false },

  -- Keep snacks.nvim enabled but we'll configure it separately
  -- { "folke/snacks.nvim", enabled = false },

  -- Optional: Also disable these if still having issues:
  -- { "akinsho/bufferline.nvim", enabled = false },
}