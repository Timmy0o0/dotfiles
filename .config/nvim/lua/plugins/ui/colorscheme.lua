return {
  -- add everforest
  {
    "sainnhe/everforest",
    config = function()
      vim.g.everforest_transparent_background = 1
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      -- style = "moon",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  -- Configure LazyVim to load everforest
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
      -- colorscheme = "tokyonight",
    },
  },
}
