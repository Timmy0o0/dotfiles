return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'folke/neodev.nvim',
        'folke/neoconf.nvim',
        'j-hui/fidget.nvim',
        'nvimdev/lspsaga.nvim',
        'stevearc/conform.nvim',
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
                },
            },
            jsonls = {},
            bashls = {},
            -- python
            pyright = {},
            -- pylsp = {},
            -- javascript
            tsserver = {},
            -- css
            tailwindcss = {},
            html = {},
            eslint = {},
            -- format install manually
            -- stylua = {},
        }

        -- format
        require('conform').setup({
            formatters_by_ft = {
                lua = { 'stylua' },
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_format = 'fallback',
            },
        })

        local on_attach = function(_, bufnr)
            -- Enable completion triggered by <c-x><c-o>
            local nmap = function(keys, func, desc)
                if desc then
                    desc = 'LSP: ' .. desc
                end
                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end

            nmap('gD', vim.lsp.buf.declaration, 'Goto Declaration')
            nmap('gd', require('telescope.builtin').lsp_definitions, 'Goto Definition')
            nmap('gk', '<cmd>Lspsaga hover_doc<cr>', 'Hover Documentation')
            nmap('gi', require('telescope.builtin').lsp_implementations, 'Goto Implementation')
            -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
            nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, 'Workspace Add Folder')
            nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Workspace Remove Folder')
            nmap('<leader>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, 'Workspace List Folders')
            nmap('<leader>D', vim.lsp.buf.type_definition, 'Type Definition')
            nmap('<leader>rn', '<cmd>Lspsaga rename ++project<cr>', 'Rename')
            nmap('<leader>ca', '<cmd>Lspsaga code_action<cr>', 'Code Action')
            nmap('<leader>da', require('telescope.builtin').diagnostics, 'Diagnostics')
            nmap('d]', '<cmd>Lspsaga diagnostic_jump_next<cr>', 'Jump Next Diagnostics')
            nmap('[d', '<cmd>Lspsaga diagnostic_jump_prev<cr>', 'Jump Prev Diagnostics')
            nmap('gr', require('telescope.builtin').lsp_references, 'Goto References')
            nmap('<space>o', '<cmd>Lspsaga outline<cr>', 'Outline | keymap: e o')
            -- nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
            -- nmap('<space>f', function()
            --     vim.lsp.buf.format({ async = true })
            -- end, 'Format Code')
        end

        require('neodev').setup()
        require('neoconf').setup()
        require('fidget').setup()
        require('lspsaga').setup()
        require('mason').setup()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require('mason-lspconfig').setup({
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
            require('lspconfig')[server].setup(
                vim.tbl_deep_extend(
                    'keep',
                    { on_attach = on_attach, capabilities = capabilities },
                    config
                )
            )
        end
    end,
}
