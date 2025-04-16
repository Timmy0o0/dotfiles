return {
  "ibhagwan/fzf-lua",
  keys = {
    { "<leader>,", false },
    { "<leader>:", false },
    { "<leader>sb", false },
    { "<leader>sg", false },
    { "<leader>sG", false },
    { "<leader>sR", false },
    { "<leader>sM", false },
    { "<leader><space>", "<cmd>FzfLua buffers<cr>", desc = "Find Buffers" },
    { "<leader>/", "<cmd>FzfLua grep_curbuf<cr>", desc = "Grep Current Buffer" },
    { "<leader>fw", "<cmd>FzfLua live_grep<cr>", desc = "Grep (Root Dir)" },
  },
}
