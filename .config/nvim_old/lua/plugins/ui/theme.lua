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
                    on_colors = function(colors)
                        colors.bg_statusline = colors.none
                    end,
                })
            end
            -- vim.cmd([[colorscheme tokyonight]])
        end,
    },
    {
        'sainnhe/everforest',
        lazy = false,
        priority = 1000,
        config = function()
            vim.opt.background = 'dark'
            if not vim.g.neovide then
                vim.g.everforest_transparent_background = 1
            end
            vim.g.everforest_background = 'soft' -- medium | hard | soft
            vim.g.everforest_foreground = 'material'
            vim.g.everforest_enable_italic = true
            vim.g.everforest_enable_bold = 1
            vim.cmd.colorscheme('everforest')
        end,
    },
    {
        'sainnhe/gruvbox-material',
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.opt.background = 'light'
            if not vim.g.neovide then
                vim.g.gruvbox_material_transparent_background = 0
            end
            vim.g.gruvbox_material_background = 'soft' -- medium | hard | soft
            vim.g.gruvbox_material_foreground = 'material'
            vim.g.gruvbox_material_enable_italic = true
            vim.g.gruvbox_material_enable_bold = 1
            -- vim.cmd.colorscheme('gruvbox-material')
        end,
    },
}
