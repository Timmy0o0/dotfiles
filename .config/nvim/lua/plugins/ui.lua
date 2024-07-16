return {
    {
        'akinsho/bufferline.nvim',
        event = 'VeryLazy',
        config = false,
        -- config = function()
        --    require("bufferline").setup()
        -- end
    },
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
                        ft_icon and {
                            ' ',
                            ft_icon,
                            ' ',
                            guibg = ft_color,
                            guifg = helpers.contrast_color(ft_color),
                        } or '',
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
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        event = 'VeryLazy',
        config = false,
        -- opts = {
        --     indent = { char = '╏' },
        -- },
    },
    {
        'goolord/alpha-nvim',
        config = function()
            require('alpha').setup(require('alpha.themes.dashboard').config)
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
            'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
            'MunifTanjim/nui.nvim',
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        config = function()
            require('neo-tree').setup({
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
        event = 'VeryLazy',
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
    {
        'echasnovski/mini.ai',
        event = 'VeryLazy',
        config = false,
    },
    {
        'echasnovski/mini.comment',
        event = 'VeryLazy',
        config = true,
    },
    {
        'echasnovski/mini.animate',
        event = 'VeryLazy',
        config = false,
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
        config = true,
    },
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
                -- vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], opts)
                -- vim.keymap.set('t', 'jj', [[<C-\><C-n>]], opts) conflicts with lazygit
                vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
                vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
                vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
                vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
                vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
            end

            -- if you only want these mappings for toggle term use term://*toggleterm#* instead
            vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
        end,
    },
    {
        'NvChad/nvim-colorizer.lua',
        event = 'VeryLazy',
        config = true,
    },
    {
        'kevinhwang91/nvim-hlslens',
        event = 'VeryLazy',
        config = function()
            require('hlslens').setup()
        end,
    },
}
