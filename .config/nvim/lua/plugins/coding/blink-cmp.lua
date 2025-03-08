return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    -- codecompanion
    -- table.insert(opts.sources.default, "codecompanion")
    -- opts.sources.providers.codecompanion = {
    --   name = "CodeCompanion",
    --   module = "codecompanion.providers.completion.blink",
    --   score_offset = 200,
    -- }
    -- avante
    -- vim.list_extend(opts.sources.compat, { "avante_commands", "avante_mentions", "avante_files" })
  end,
}
