require("git"):setup({
	show_branch = true,
})

require("session"):setup({
	sync_yanked = true,
})

require("full-border"):setup()

require("copy-file-contents"):setup({
	clipboard_cmd = "wl-copy",
	append_char = "\n",
	notification = true,
})
