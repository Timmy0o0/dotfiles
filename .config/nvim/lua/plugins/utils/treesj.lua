return {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
        use_default_keymaps = false,
    },
    keys = {
        {
            '<leader>j',
            mode = 'n',
            function()
                require('treesj').toggle()
            end,
            desc = 'Treesj: toggle block',
        },
        {
            '<leader>J',
            mode = 'n',
            function()
                require('treesj').toggle({ split = { recursive = true } })
            end,
            desc = 'Treesj: recursive toggle block',
        },
    },
}
