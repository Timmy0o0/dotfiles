return {
  "keaising/im-select.nvim",
  event = "VeryLazy",
  opts = function()
    -- Initialize variables for input method select and command
    local default_im_select
    local default_command

    -- Get current system name
    local system = vim.uv.os_uname().sysname

    -- Auto detect system and set appropriate values
    if system == "Windows" or system == "Windows_NT" or string.find(vim.loop.os_uname().release:lower(), "microsoft") then
      -- Windows or WSL
      default_im_select = "1033" -- English US Keyboard
      default_command = "im-select.exe"
    elseif system == "Darwin" then
      -- For macOS, default: "com.apple.keylayout.ABC", aka: US
      default_im_select = "com.apple.keylayout.ABC"
      default_command = "macism"
    else
      -- Linux
      -- Check available input method frameworks
      local has_fcitx5 = vim.fn.executable("fcitx5-remote") == 1
      local has_ibus = vim.fn.executable("ibus") == 1

      -- Set appropriate values based on available input method
      if has_fcitx5 then
        default_im_select = "keyboard-us"
        default_command = "fcitx5-remote"
      elseif has_ibus then
        default_im_select = "xkb:us::eng"
        default_command = "ibus"
      else
        -- Default values if no input method is detected
        default_im_select = "keyboard-us"
        default_command = "fcitx5-remote"
      end
    end

    return {
      default_im_select = default_im_select,
      default_command = default_command,
      -- Restore the default input method state when the following events are triggered
      set_default_events = { "VimEnter", "FocusGained", "InsertLeave", "CmdlineLeave" },
      set_previous_events = {},
      -- Show notification about how to install executable binary when binary missed
      keep_quiet_on_no_binary = false,
      -- Async run `default_command` to switch IM or not
      async_switch_im = true,
    }
  end,
}
