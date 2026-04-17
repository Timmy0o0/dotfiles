return {
  "rmagatti/alternate-toggler",
  event = { "BufReadPost" },
  keys = {
    { "<leader>i", "<cmd>ToggleAlternate<CR>", desc = "Toggle alternate" },
  },
  config = function()
    require("alternate-toggler").setup()
  end,
}
