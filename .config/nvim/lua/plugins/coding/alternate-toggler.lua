return {
  "rmagatti/alternate-toggler",
  event = { "BufReadPost" },
  opts = {
    alternates = {
      ["=="] = "!=",
    },
  },
  keys = {
    { "<leader>i", "<cmd>lua require('alternate-toggler').toggleAlternate()<cr>", desc = "Toggle" },
  },
}
