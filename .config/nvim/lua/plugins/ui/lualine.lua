return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    -- bubbles
    options = {
      component_separators = "",
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = {
        { "filename", path = 4 },
      },
      lualine_x = {
        {},
      },
      lualine_y = {
        "filetype",
        {
          function()
            local function get_lsp_names()
              local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
              if #buf_clients == 0 then
                return "No LSP"
              end
              local client_names = {}
              for _, client in pairs(buf_clients) do
                table.insert(client_names, client.name)
              end
              return table.concat(client_names, ", ")
            end
            return get_lsp_names()
          end,
        },
        "progress",
      },
      lualine_z = {
        { "location", separator = { right = "" }, left_padding = 2 },
      },
    },
    inactive_sections = {
      lualine_a = { "filename" },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "location" },
    },
  },
}
