require("full-border"):setup()
require("git"):setup({})
require("starship"):setup()
require("copy-file-contents"):setup({
  clipboard_cmd = "win32yank.exe -i",
  -- clipboard_cmd = "wl-copy",
  append_char = "\n",
  notification = true,
})
require("session"):setup({
  sync_yanked = true,
}) 