-- ~/.config/nvim/lua/plugins/blink.lua
--
-- Manual trigger only - no automatic popups!
-- Prevents autocomplete from interfering with normal typing flow.
-- Use Ctrl+Space to manually trigger completions when needed.
-- Accept completions with Ctrl+Y.

return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        menu = {
          -- Disable automatic popup - only show when manually triggered
          auto_show = false,
        },
      },
      keymap = {
        preset = "none", -- Start with no preset to define our own mappings

        -- Manually trigger completion with Ctrl+Space
        ["<C-Space>"] = { "show", "fallback" },

        -- Accept completion ONLY with Ctrl+Y
        ["<C-y>"] = { "accept", "fallback" },

        -- Navigation
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-u>"] = { "scroll_documentation_up", "fallback" },
        ["<C-d>"] = { "scroll_documentation_down", "fallback" },

        -- Close completion menu
        ["<C-e>"] = { "cancel", "fallback" },

        -- Tab does NOTHING with completion (just normal tab)
        ["<Tab>"] = { "fallback" },
        ["<S-Tab>"] = { "fallback" },

        -- Enter does NOTHING with completion (just new line)
        ["<CR>"] = { "fallback" },
      },
    },
  },
}