return {
    'kamykn/spelunker.vim',
    event = 'VeryLazy',
    config = function()
        vim.g.spelunker_check_type = 2
        vim.api.nvim_set_keymap('n', '<leader>sa', '<cmd>SpelunkerAddAll<cr>', { noremap = true })
    end,
}
