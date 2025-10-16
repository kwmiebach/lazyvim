-- ~/.config/nvim/lua/plugins/blink.lua
--
-- Reverts capturing of Tab/Enter keys by blink.cmp completion popups.
-- Prevents autocomplete from interfering with normal typing flow.
-- Completions now require explicit accept with Ctrl+Y instead.

return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "none", -- Start with no preset to define our own mappings

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