return {
    'hrsh7th/nvim-cmp',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = {
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline',
        'luckasRanarison/tailwind-tools.nvim',
        'onsails/lspkind.nvim',
        {
            'saadparwaiz1/cmp_luasnip',
            dependencies = {
                'L3MON4D3/LuaSnip',
                dependencies = {
                    'rafamadriz/friendly-snippets',
                },
                version = 'v2.*',
                build = 'make install_jsregexp',
            },
        },
    },
    config = function()
        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
        end

        require('tailwind-tools').setup({})
        local lspkind = require('lspkind')
        require('luasnip.loaders.from_vscode').lazy_load()
        local luasnip = require('luasnip')
        -- enable html snippets on jsx/tsx filetype
        luasnip.filetype_extend('javascriptreact', { 'html' })
        luasnip.filetype_extend('typescriptreact', { 'html' })
        local cmp = require('cmp')
        cmp.setup({

            -- icon conf lspkind
            formatting = {
                format = lspkind.cmp_format({
                    symbol_map = { Copilot = '', FittenCode = '' },
                    before = require('tailwind-tools.cmp').lspkind_format,
                }),
            },
            -- vim.api.nvim_set_hl(0, 'CmpItemKindFittenCode', { fg = '#6CC644' }),

            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            sources = cmp.config.sources({
                { name = 'path' },
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = 'fittencode', group_index = 1 },
            }),
            mapping = cmp.mapping.preset.insert({
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),

                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),
            experimental = {
                ghost_text = true,
            },
        })

        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' },
            },
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' },
                { name = 'cmdline' },
            }),
        })
    end,
}
