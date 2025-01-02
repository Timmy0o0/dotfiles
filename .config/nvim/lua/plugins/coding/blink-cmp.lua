return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    table.insert(opts.sources.default, "codecompanion")
    opts.sources.providers.codecompanion = {
      name = "CodeCompanion",
      module = "codecompanion.providers.completion.blink",
      score_offset = 100,
    }
  end,
}
