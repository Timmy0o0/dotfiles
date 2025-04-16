return {
  "supermaven-inc/supermaven-nvim",
  opts = function(_, opts)
    table.insert(opts.ignore_filetypes, "codecompanion")
  end,
}
