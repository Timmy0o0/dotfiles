return {
  -- add everforest
  {
    "sainnhe/everforest",
    config = function()
      vim.g.everforest_transparent_background = 2
      vim.g.everforest_style = "light"
    end,
  },
  -- Configure LazyVim to load everforest
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },
}
