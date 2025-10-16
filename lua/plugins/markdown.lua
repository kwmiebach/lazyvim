-- ~/.config/nvim/lua/plugins/markdown.lua
--
-- Ensure markdown files display raw content without any rendering or concealment.
--
-- This configuration:
-- 1. Disables concealment (no hiding of markdown syntax)
-- 2. Prevents any markdown rendering plugins from loading
-- 3. Maintains markdown as plain text for editing

return {
  -- Disable render-markdown if it gets loaded by any dependency
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
  },

  -- Disable markdown preview plugin if present
  {
    "iamcco/markdown-preview.nvim",
    enabled = false,
  },

  -- Configure treesitter to not conceal markdown
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        enable = true,
        -- Disable additional vim regex highlighting for markdown
        -- which can cause concealment
        additional_vim_regex_highlighting = { "markdown" },
      },
    },
  },

  -- Set markdown-specific options via autocmd
  {
    "LazyVim/LazyVim",
    opts = function()
      -- Disable concealment for markdown files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "markdown", "markdown.mdx" },
        callback = function()
          vim.opt_local.conceallevel = 0  -- Show all text, no concealment
          vim.opt_local.concealcursor = "" -- Never conceal, even on cursor line
        end,
      })
    end,
  },
}