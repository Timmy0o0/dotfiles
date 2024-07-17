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
            -- vim.cmd([[colorscheme tokyonight]])
        end,
    },
    {
        'sainnhe/everforest',
        lazy = false,
        priority = 1000,
        config = function()
            if not vim.g.neovide then
                vim.g.everforest_transparent_background = 2
            end
            vim.g.everforest_diagnostic_line_highlight = 0
            vim.g.everforest_enable_italic = true
            vim.cmd.colorscheme('everforest')
        end,
    },
    {
        'Mofiqul/vscode.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            local c = require('vscode.colors').get_colors()
            -- vim.o.background = 'light'
            require('vscode').setup({
                transparent = false,
                italic_comments = true,
                disable_nvimtree_bg = true,
                underline_links = true,
                group_overrides = {
                    Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
                },
            })
            -- vim.cmd.colorscheme('vscode')
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            -- lualine transparent
            -- local theme = require('lualine.themes.tokyonight')
            -- theme.normal.c.bg = nil
            require('lualine').setup({
                options = {
                    theme = 'auto',
                    -- theme = theme,
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
}
