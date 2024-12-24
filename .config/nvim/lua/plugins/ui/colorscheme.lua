return {
  -- add everforest
  {
    "sainnhe/everforest",
    config = function()
      vim.g.everforest_transparent_background = 1
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
