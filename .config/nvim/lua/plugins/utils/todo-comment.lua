return {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
    keys = {
        {
            ']t',
            mode = 'n',
            function()
                require('todo-comments').jump_next()
            end,
            { desc = 'Next todo comment' },
        },
        {
            '[t',
            mode = 'n',
            function()
                require('todo-comments').jump_prev()
            end,
            { desc = 'Previous todo comment' },
        },
        { '<leader>ft', mode = 'n', '<cmd>TodoTelescope<cr>', { desc = 'Telescope: find todo comments' } },
    },
}
