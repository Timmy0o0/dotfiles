-- stylua: ignore
if true then return {} end

return {
  "echasnovski/mini.diff",
  version = false,
  event = "BufRead", -- Load the plugin when a buffer is read
  opts = {},
}
