-- stylua: ignore
if true then return {} end

return {
  "luozhiya/fittencode.nvim",
  event = "InsertEnter",
  opts = {
    completion_mode = "source",
  },
}
