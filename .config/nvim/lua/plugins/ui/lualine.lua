return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- opts.options.component_separators = { left = "", right = "" }
    -- opts.options.section_separators = { left = "", right = "" }
    -- opts.options.component_separators = { left = "┃", right = "┃" }
    opts.options.component_separators = { left = "│", right = "│" }
    opts.options.section_separators = { left = "", right = "" }

    table.insert(opts.sections.lualine_x, "overseer")
  end,
}
