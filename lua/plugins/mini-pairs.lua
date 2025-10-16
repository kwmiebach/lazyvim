-- ~/.config/nvim/lua/plugins/mini-pairs.lua
--
-- Ensure clean, predictable typing by disabling mini.pairs auto-pairing.
--
-- LazyVim includes mini.pairs in its default configuration.
-- Rather than modifying the distribution directly, we disable it here
-- through LazyVim's override mechanism

return {
  {
    "echasnovski/mini.pairs",
    enabled = false,
  },
}

