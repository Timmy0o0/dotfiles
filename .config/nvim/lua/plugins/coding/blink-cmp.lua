return {
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        -- add lazydev to your completion providers
        default = {
          "fittencode",
          -- "avante_commands",
          -- "avante_mentions",
          -- "avante_files",
        },
        -- compat = {
        --   "avante_commands",
        --   "avante_mentions",
        --   "avante_files",
        -- },
        providers = {
          fittencode = {
            name = "fittencode",
            module = "fittencode.sources.blink",
            score_offset = 100,
            async = true,
          },
          -- avante_commands = {
          --   name = "avante_commands",
          --   module = "blink.compat.source",
          --   score_offset = 90, -- show at a higher priority than lsp
          --   opts = {},
          -- },
          -- avante_files = {
          --   name = "avante_commands",
          --   module = "blink.compat.source",
          --   score_offset = 100, -- show at a higher priority than lsp
          --   opts = {},
          -- },
          -- avante_mentions = {
          --   name = "avante_mentions",
          --   module = "blink.compat.source",
          --   score_offset = 1000, -- show at a higher priority than lsp
          --   opts = {},
          -- },
        },
      },
    },
  },
  -- {
  --   "saghen/blink.compat",
  --   optional = true, -- make optional so it's only enabled if any extras need it
  --   opts = {},
  --   version = not vim.g.lazyvim_blink_main and "*",
  -- },
}
