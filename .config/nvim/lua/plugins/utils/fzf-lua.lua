return {
  "ibhagwan/fzf-lua",
  keys = {
    { "<leader>,", false },
    { "<leader>/", false },
    { "<leader>:", false },
    { "<leader>sb", false },
    { "<leader>sg", false },
    { "<leader>sj", false },
    { "<leader>sG", false },
    { "<leader>sR", false },
    { "<leader>sM", false },
    { "<leader><space>", "<cmd>FzfLua buffers<cr>", desc = "Find Buffers" },
    { "<leader>fw", "<cmd>FzfLua live_grep<cr>", desc = "Grep (Root Dir)" },
  },
}