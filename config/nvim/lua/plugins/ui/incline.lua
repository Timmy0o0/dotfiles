return {
  "b0o/incline.nvim",
  event = "VeryLazy",
  opts = function()
    local devicons = require("nvim-web-devicons")
    local helpers = require("incline.helpers")

    -- helper function to format path: show only last 2 parent directories
    local function format_path(buf_name)
      local path = vim.fn.fnamemodify(buf_name, ":~:.")
      local parts = vim.split(path, "/")

      -- if path has more than 3 parts, show ... + last 2 parts
      if #parts > 3 then
        return ".../" .. table.concat({ parts[#parts - 1], parts[#parts] }, "/")
      end
      return path
    end

    return {
      window = {
        padding = 0,
        margin = { horizontal = 0 },
      },
      render = function(props)
        -- get relative path instead of just filename
        local filepath = format_path(vim.api.nvim_buf_get_name(props.buf))
        if filepath == "" then
          filepath = "[No Name]"
        end

        -- get icon for the file
        local ft_icon, ft_color = devicons.get_icon_color(filepath)
        local modified = vim.bo[props.buf].modified

        -- add modified indicator
        local modified_indicator = modified and " [+]" or ""

        return {
          ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
          " ",
          { filepath .. modified_indicator, gui = "bold" },
          " ",
        }
      end,
    }
  end,
}
