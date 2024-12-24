-- stylua: ignore
if true then return {} end

return {
  "saghen/blink.cmp",
  opts = {
    sources = {
      default = {
        "fittencode",
      },
      providers = {
        fittencode = {
          kind = "Codeium",
          name = "fittencode",
          module = "fittencode.sources.blink",
          score_offset = 100,
          async = true,
        },
      },
    },
  },
}
