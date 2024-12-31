return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {
    settings = {
      code_lens = "all",
      tsserver_file_preferences = {
        includeInlayParameterNameHints = "all",
        includeCompletionsForModuleExports = true,
        quotePreference = "auto",
      },
      tsserver_format_options = {
        allowIncompleteCompletions = false,
        allowRenameOfImportPath = false,
      },
    },
    -- Move on_attach inside opts
    on_attach = function(_, bufnr)
      vim.keymap.set(
        "n",
        "<leader>co",
        "<cmd>TSToolsOrganizeImports<CR>",
        { buffer = bufnr, desc = "Typescript Organize Imports" }
      )
      vim.keymap.set(
        "n",
        "<leader>cM",
        "<cmd>TSToolsAddMissingImports<CR>",
        { buffer = bufnr, desc = "Typescript Add Missing Imports" }
      )
      vim.keymap.set(
        "n",
        "<leader>cu",
        "<cmd>TSToolsRemoveUnusedImports<CR>",
        { buffer = bufnr, desc = "Typescript Remove Unused Imports" }
      )
      -- vim.keymap.set(
      --   "n",
      --   "<leader>cR",
      --   "<cmd>TSToolsRenameFile<CR>",
      --   { buffer = bufnr, desc = "Typescript Rename File" }
      -- )
      -- vim.api.nvim_create_autocmd("BufWritePre", {
      --   pattern = "*.ts,*.tsx,*.jsx,*.js",
      --   callback = function(args)
      --     vim.cmd("TSToolsAddMissingImports sync")
      --     vim.cmd("TSToolsOrganizeImports sync")
      --     require("conform").format({ bufnr = args.buf })
      --   end,
      -- })
    end,
  },
}
