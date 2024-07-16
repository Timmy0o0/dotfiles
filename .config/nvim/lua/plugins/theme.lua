return {
    {
        'folke/tokyonight.nvim',
        dependencies = {
            'nvim-lualine/lualine.nvim',
            'nvim-tree/nvim-web-devicons',
            'utilyre/barbecue.nvim',
            'SmiteshP/nvim-navic',
        },
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
            require('lualine').setup({
                options = {
                    theme = 'tokyonight',
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
            require('barbecue').setup({
                theme = 'tokyonight',
            })
        end,
    },
}
