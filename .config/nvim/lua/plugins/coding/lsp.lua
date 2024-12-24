return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      -- local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable
      -- keys[#keys + 1] = { "K", false }
      -- add new gk keymap with the same functionality
      -- keys[#keys + 1] = { "gk", vim.lsp.buf.hover, desc = "Hover Documentation" }
      -- keys[#keys + 1] = { "gk", LazyVim.lsp.hover, desc = "Hover Documentation" }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          keys = {
            {
              "<leader>co",
              LazyVim.lsp.action["source.organizeImports"],
              desc = "Organize Imports",
            },
            {
              "<leader>cM",
              LazyVim.lsp.action["source.addMissingImports.ts"],
              desc = "Add missing imports",
            },
            {
              "<leader>cu",
              LazyVim.lsp.action["source.removeUnused.ts"],
              desc = "Remove unused imports",
            },
          },
        },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "tailwindcss-language-server",
        "prisma-language-server",
        "stylua",
        -- format
        "prettierd",
        -- lint
        "eslint_d",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
      },
    },
  },
}
