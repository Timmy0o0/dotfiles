return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        'pmizio/typescript-tools.nvim',
        'folke/neodev.nvim',
        'folke/neoconf.nvim',
        'j-hui/fidget.nvim',
        'nvimdev/lspsaga.nvim',
        'stevearc/conform.nvim',
        'mfussenegger/nvim-lint',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- 'neovim/nvim-lspconfig',
        },
    },

    config = function()
        local lsp_servers = {
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
            pyright = {},
            -- pylsp = {},
            -- tsserver = {},
            tailwindcss = {},
            html = {},
            -- eslint = {},
            rust_analyzer = {},
        }
        local other_servers = {
            -- format
            stylua = {},
            prettierd = {},
            autopep8 = {},
            -- lint
            eslint_d = {},
            pylint = {},
        }
        local servers = vim.tbl_extend('keep', lsp_servers, other_servers)

        -- format setup
        require('conform').setup({
            formatters_by_ft = {
                lua = { 'stylua' },
                javascript = { 'prettierd' },
                typescript = { 'prettierd' },
                javascriptreact = { 'prettierd' },
                typescriptreact = { 'prettierd' },
                css = { 'prettierd' },
                html = { 'prettierd' },
                json = { 'prettierd' },
                yaml = { 'prettierd' },
                markdown = { 'prettierd' },
                graphql = { 'prettierd' },
                python = { 'autopep8' },
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_format = 'fallback',
            },
        })

        -- lint setup
        require('lint').linters_by_ft = {
            javascript = { 'eslint_d' },
            typescript = { 'eslint_d' },
            javascriptreact = { 'eslint_d' },
            typescriptreact = { 'eslint_d' },
            python = { 'pylint' },
        }
        vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
            callback = function()
                require('lint').try_lint()
            end,
        })

        -- lsp keymap
        local on_attach = function(_, bufnr)
            local nmap = function(keys, func, desc)
                if desc then
                    desc = 'LSP: ' .. desc
                end
                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end

            -- stylua: ignore start
            nmap('gD', vim.lsp.buf.declaration, 'Goto Declaration')
            nmap('gd', require('telescope.builtin').lsp_definitions, 'Goto Definition')
            nmap('gk', '<cmd>Lspsaga hover_doc<cr>', 'Hover Documentation')
            nmap('gi', require('telescope.builtin').lsp_implementations, 'Goto Implementation')
            nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, 'Workspace Add Folder')
            nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Workspace Remove Folder')
            nmap('<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, 'Workspace List Folders')
            nmap('<leader>D', vim.lsp.buf.type_definition, 'Type Definition')
            nmap('<leader>rn', '<cmd>Lspsaga rename ++project<cr>', 'Rename')
            nmap('<leader>ca', '<cmd>Lspsaga code_action<cr>', 'Code Action')
            nmap('<leader>da', require('telescope.builtin').diagnostics, 'Diagnostics')
            nmap(']d', '<cmd>Lspsaga diagnostic_jump_next<cr>', 'Next Diagnostics')
            nmap('[d', '<cmd>Lspsaga diagnostic_jump_prev<cr>', 'Prev Diagnostics')
            nmap('gr', require('telescope.builtin').lsp_references, 'Goto References')
            nmap('<leader>o', '<cmd>Lspsaga outline<cr>', 'Outline | keymap: e o')
            -- keymap for ts_tool
            nmap('<leader>tR', '<cmd>TSToolsRemoveUnused<cr>', 'ts_tool: removes all unused statements')
            nmap('<leader>tr', '<cmd>TSToolsRenameFile<cr>', 'ts_tool: rename current file and apply changes to connected')
            nmap('<leader>tf', '<cmd>TSToolsFileReferences<cr>', 'ts_tool: find files that reference the current')
            -- stylua: ignore end
        end

        -- lsp icon
        vim.fn.sign_define({
            { name = 'DiagnosticSignError', text = '', texthl = 'DiagnosticSignError', linehl = 'ErrorLine' },
            { name = 'DiagnosticSignWarn', text = '', texthl = 'DiagnosticSignWarn', linehl = 'WarningLine' },
            { name = 'DiagnosticSignInfo', text = '', texthl = 'DiagnosticSignInfo', linehl = 'InfoLine' },
            { name = 'DiagnosticSignHint', text = '', texthl = 'DiagnosticSignHint', linehl = 'HintLine' },
        })

        -- dependencies setup
        require('neodev').setup()
        require('neoconf').setup()
        require('fidget').setup({ notification = { window = { winblend = 0 } } })
        require('lspsaga').setup()
        require('mason').setup()
        require('mason-tool-installer').setup({
            ensure_installed = vim.tbl_keys(servers),
        })

        -- lsp setup
        require('typescript-tools').setup({})
        vim.api.nvim_create_autocmd('BufWritePre', {
            pattern = '*.ts,*.tsx,*.jsx,*.js',
            callback = function(args)
                vim.cmd('TSToolsAddMissingImports sync')
                vim.cmd('TSToolsOrganizeImports sync')
                require('conform').format({ bufnr = args.buf })
            end,
        })
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        for server, config in pairs(lsp_servers) do
            require('lspconfig')[server].setup(vim.tbl_deep_extend('keep', { on_attach = on_attach, capabilities = capabilities }, config))
        end
    end,
}
