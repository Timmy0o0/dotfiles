return {
    {
        'b0o/incline.nvim',
        event = 'VeryLazy',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            local helpers = require('incline.helpers')
            local devicons = require('nvim-web-devicons')
            require('incline').setup({
                window = {
                    padding = 0,
                    margin = { horizontal = 0 },
                },
                render = function(props)
                    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
                    if filename == '' then
                        filename = '[No Name]'
                    end
                    local ft_icon, ft_color = devicons.get_icon_color(filename)
                    local modified = vim.bo[props.buf].modified
                    return {
                        ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or '',
                        ' ',
                        { filename, gui = modified and 'bold,italic' or 'bold' },
                        ' ',
                        guibg = '#44406e',
                    }
                end,
            })
        end,
    },
    {
        'RRethy/vim-illuminate',
        event = 'VeryLazy',
        config = function()
            require('illuminate').configure()
        end,
    },
    {
        'yamatsum/nvim-cursorline',
        config = function()
            require('nvim-cursorline').setup({
                cursorline = {
                    enable = true,
                    timeout = 1000,
                    number = false,
                },
                cursorword = {
                    enable = true,
                    min_length = 3,
                    hl = { underline = true },
                },
            })
        end,
    },
    {
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
    },
    {
        'folke/which-key.nvim',
        dependencies = {
            'echasnovski/mini.icons',
        },
        event = 'VeryLazy',
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {},
    },
    {
        'echasnovski/mini.comment',
        event = 'VeryLazy',
        config = true,
    },
    {
        'echasnovski/mini.files',
        event = 'VeryLazy',
        config = function()
            require('mini.files').setup()
            vim.keymap.set({ 'n' }, '<C-e>', '<cmd>lua MiniFiles.open()<cr>')
        end,
    },
    {
        'echasnovski/mini.indentscope',
        event = 'VeryLazy',
        config = function()
            require('mini.indentscope').setup({
                symbol = '╏',
            })
            vim.cmd('hi! MiniIndentscopeSymbol guifg=#E5C07B')
            -- vim.cmd('hi! MiniIndentscopeSymbol guifg=#C678DD')
        end,
    },
    -- {
    --     'lukas-reineke/indent-blankline.nvim',
    --     main = 'ibl',
    --     config = function()
    --         local highlight = {
    --             'RainbowYellow',
    --             'RainbowRed',
    --             'RainbowBlue',
    --             'RainbowOrange',
    --             'RainbowGreen',
    --             'RainbowViolet',
    --             'RainbowCyan',
    --         }
    --         local hooks = require('ibl.hooks')
    --         -- create the highlight groups in the highlight setup hook, so they are reset
    --         -- every time the colorscheme changes
    --         hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    --             vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#E5C07B' })
    --             vim.api.nvim_set_hl(0, 'RainbowRed', { fg = '#E06C75' })
    --             vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#61AFEF' })
    --             vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = '#D19A66' })
    --             vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#98C379' })
    --             vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#C678DD' })
    --             vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#56B6C2' })
    --         end)
    --
    --         require('ibl').setup({
    --             scope = {
    --                 enabled = true,
    --                 highlight = highlight,
    --                 priority = 500,
    --             },
    --         })
    --     end,
    -- },
    {
        'akinsho/toggleterm.nvim',
        event = 'VeryLazy',
        version = '*',
        config = function()
            require('toggleterm').setup({
                open_mapping = [[<c-\>]],
            })

            function _G.set_terminal_keymaps()
                local opts = { buffer = 0 }
                vim.keymap.set('t', '<C-n>', [[<C-\><C-n>]], opts)
                vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
                vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
                vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
                vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
                vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
            end

            vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
        end,
    },
    {
        'NvChad/nvim-colorizer.lua',
        event = 'VeryLazy',
        opts = {
            user_default_options = {
                names = false,
                mode = 'foreground',
            },
        },
    },
    {
        'kevinhwang91/nvim-hlslens',
        event = 'VeryLazy',
        config = function()
            require('hlslens').setup()
        end,
    },
}
