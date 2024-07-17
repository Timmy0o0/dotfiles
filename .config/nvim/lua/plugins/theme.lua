return {
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            -- conflict with neovide
            if not vim.g.neovide then
                require('tokyonight').setup({
                    transparent = true,
                    styles = {
                        sidebars = 'transparent',
                        floats = 'transparent',
                    },
                })
            end
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            -- lualine transparent
            local theme = require('lualine.themes.tokyonight')
            theme.normal.c.bg = nil
            require('lualine').setup({
                options = {
                    -- theme = 'tokyonight',
                    -- theme = 'auto',
                    theme = theme,
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { { 'filename', path = 4 } },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' },
                },
            })
        end,
    },
    {
        'utilyre/barbecue.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'SmiteshP/nvim-navic',
        },
        config = function()
            require('barbecue').setup({
                theme = 'tokyonight',
            })
        end,
    },
}
