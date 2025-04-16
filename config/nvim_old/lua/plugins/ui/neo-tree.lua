return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
    config = function()
        require('neo-tree').setup({
            default_component_configs = {
                diagnostics = {
                    symbols = {
                        hint = '',
                        info = '',
                        warn = '',
                        error = '',
                    },
                    highlights = {
                        hint = 'DiagnosticSignHint',
                        info = 'DiagnosticSignInfo',
                        warn = 'DiagnosticSignWarn',
                        error = 'DiagnosticSignError',
                    },
                },
            },
            window = {
                mappings = {
                    ['l'] = 'open',
                },
            },
            filesystem = {
                window = {
                    mappings = {
                        ['gk'] = 'prev_git_modified',
                        ['gj'] = 'next_git_modified',
                    },
                },
            },
        })
        vim.keymap.set({ 'n', 'v' }, '<leader>e', [[<cmd>Neotree toggle<cr>]])
    end,
}
