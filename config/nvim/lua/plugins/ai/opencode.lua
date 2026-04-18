return {
  "nickjvandyke/opencode.nvim",
  config = function()
    vim.o.autoread = true -- Required for `opts.events.reload`

    local opencode_window = "opencode"
    local opencode_cmd = "opencode --port"

    local function tmux_window_exists()
      local windows = vim.fn.systemlist({ "tmux", "list-windows", "-F", "#W" })
      return vim.tbl_contains(windows, opencode_window)
    end

    vim.g.opencode_opts = {
      server = {
        start = function()
          if not tmux_window_exists() then
            vim.fn.system({ "tmux", "new-window", "-d", "-n", opencode_window, opencode_cmd })
          end
        end,
        stop = function()
          if tmux_window_exists() then
            vim.fn.system({ "tmux", "kill-window", "-t", opencode_window })
          end
        end,
        toggle = function()
          if tmux_window_exists() then
            vim.fn.system({ "tmux", "select-window", "-t", opencode_window })
          else
            vim.fn.system({ "tmux", "new-window", "-n", opencode_window, opencode_cmd })
          end
        end,
      },
    }

    local opencode = require("opencode")

    vim.keymap.set("n", "<leader>oa", function()
      opencode.ask("@buffer: ")
    end, { desc = "Ask AI about current buffer" })

    vim.keymap.set("v", "<leader>oa", function()
      opencode.ask("@this: ")
    end, { desc = "Ask AI about selected text" })
  end,
}
