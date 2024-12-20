return {
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = true,
    },
    {
        'folke/flash.nvim',
        event = 'VeryLazy',
        opts = {},
        -- stylua: ignore
        keys = {
            { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
            -- key  f
        },
    },
    {
        'kamykn/spelunker.vim',
        event = 'VeryLazy',
        config = function()
            vim.g.spelunker_check_type = 2

            vim.api.nvim_set_keymap('n', '<leader>sa', '<cmd>SpelunkerAddAll<cr>', { noremap = true })
        end,
    },
    {
        'iamcco/markdown-preview.nvim',
        event = 'VeryLazy',
        cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
        ft = { 'markdown' },
        build = function()
            vim.fn['mkdp#util#install']()
        end,
    },
    {
        'sustech-data/wildfire.nvim',
        event = 'VeryLazy',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require('wildfire').setup()
        end,
    },
    {
        'windwp/nvim-ts-autotag',
        event = 'VeryLazy',
        config = function()
            require('nvim-ts-autotag').setup()
        end,
    },
    {
        'rmagatti/alternate-toggler',
        event = { 'BufReadPost' },
        config = function()
            require('alternate-toggler').setup({
                alternates = {
                    ['=='] = '!=',
                },
            })

            vim.keymap.set('n', '<leader>i', "<cmd>lua require('alternate-toggler').toggleAlternate()<cr>", { desc = 'Toggle Bool' })
        end,
    },
    {
        'smoka7/multicursors.nvim',
        event = 'VeryLazy',
        dependencies = {
            'nvimtools/hydra.nvim',
        },
        cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
        config = function()
            require('multicursors').setup({
                vim.keymap.set({ 'n', 'v' }, '<leader>m', '<cmd>MCstart<cr>', { desc = 'MCstart' }),
            })
        end,
    },
    {
        'axelvc/template-string.nvim',
        config = true,
    },
}
