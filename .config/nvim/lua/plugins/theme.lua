return {
    {
        "folke/tokyonight.nvim",
        dependencies = {
            'nvim-lualine/lualine.nvim',
            'nvim-tree/nvim-web-devicons',
            "utilyre/barbecue.nvim",
            "SmiteshP/nvim-navic",
        },
        lazy = false,
        priority = 1000,
        config = function()
            -- require("tokyonight").setup {
            --     transparent = true,
            --     styles = {
            --         sidebars = "transparent",
            --         floats = "transparent",
            --     }
            -- }
            vim.cmd([[colorscheme tokyonight]])
            require('lualine').setup({
                options = {
                    theme = 'tokyonight'
                }
            })
            require('barbecue').setup {
                theme = 'tokyonight',
            }
        end,
    },
}
