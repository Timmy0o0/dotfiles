return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "folke/neodev.nvim",
        "folke/neoconf.nvim",
        "j-hui/fidget.nvim",
        "nvimdev/lspsaga.nvim",
    },

    config = function()
        local servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    },
                    -- diagnostics = {globals = { "on_attach"}},
                }
            },
            jsonls = {},
            bashls = {},
            -- python
            -- pyright = {},
            pylsp = {},
            -- javascript
            tsserver = {},
            -- css
            tailwindcss = {},
            html = {},
            eslint = {},
        }

        local on_attach = function(_, bufnr)
            -- Enable completion triggered by <c-x><c-o>
            local nmap = function(keys, func, desc)
                -- if desc then
                --     desc = 'LSP: ' .. desc
                -- end
                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end

            nmap('gD', vim.lsp.buf.declaration, '[L][G][D] Goto Declaration')
            nmap('gd', require "telescope.builtin".lsp_definitions, '[L][G][D] Goto Definition')
            nmap('gk', "<cmd>Lspsaga hover_doc<CR>", '[L][H][D] Hover Documentation')
            nmap('gi', require "telescope.builtin".lsp_implementations, '[L][G][I] Goto Implementation')
            -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
            nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[L][W][A] Workspace Add Folder')
            nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[L][W][R] Workspace Remove Folder')
            nmap('<leader>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, '[L][W][L] Workspace List Folders')
            nmap('<leader>D', vim.lsp.buf.type_definition, '[L][T][D] Type Definition')
            nmap('<leader>rn', "<cmd>Lspsaga rename ++project<cr>", '[L][R][N] Rename')
            nmap('<leader>ca', "<cmd>Lspsaga code_action<CR>", '[L][C][A] Code Action')
            nmap('<leader>da', require "telescope.builtin".diagnostics, '[L][D][A] Diagnostics')
            nmap('gr', require('telescope.builtin').lsp_references, '[L][G][R] Goto References')
            -- nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
            nmap("<space>f", function()
                vim.lsp.buf.format { async = true }
            end, "[L][F][C] Format code")
        end

        require("neodev").setup()
        require("neoconf").setup()
        require("fidget").setup()
        require("lspsaga").setup()
        require("mason").setup()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require("mason-lspconfig").setup({
            ensure_installed = vim.tbl_keys(servers),

            -- handlers = {
            --     function(server_name)
            --         require("lspconfig")[server_name].setup {
            --             settings = servers[server_name],
            --             on_attach = on_attach,
            --             capabilities = capabilities
            --         }
            --     end
            -- }
        })

        for server, config in pairs(servers) do
            require("lspconfig")[server].setup(
                vim.tbl_deep_extend("keep",
                    { on_attach = on_attach, capabilities = capabilities },
                    config
                )
            )
        end
    end
}
