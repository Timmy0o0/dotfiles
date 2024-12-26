return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.options = opts.options or {}
    -- opts.options.component_separators = { left = "", right = "" }
    -- opts.options.section_separators = { left = "", right = "" }
    -- opts.options.component_separators = { left = "┃", right = "┃" }
    opts.options.component_separators = { left = "│", right = "│" }
    opts.options.section_separators = { left = "", right = "" }

    opts.sections = opts.sections or {}
    opts.sections.lualine_x = opts.sections.lualine_x or {}
    table.insert(opts.sections.lualine_x, "overseer")
  end,
}
