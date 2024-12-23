return {
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
}
