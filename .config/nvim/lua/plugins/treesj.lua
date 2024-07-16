return {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
        require('treesj').setup({
            use_default_keymaps = false,
        })
        vim.keymap.set(
            'n',
            '<leader>j',
            require('treesj').toggle,
            { desc = 'Treesj: toggle block' }
        )
        vim.keymap.set('n', '<leader>J', function()
            require('treesj').toggle({ split = { recursive = true } })
        end, { desc = 'Treesj: recursive toggle block' })
    end,
}
