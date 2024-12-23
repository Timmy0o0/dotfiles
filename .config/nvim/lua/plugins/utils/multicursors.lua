return {
    'smoka7/multicursors.nvim',
    event = 'VeryLazy',
    dependencies = {
        'nvimtools/hydra.nvim',
    },
    cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
    keys = {
        {
            '<leader>m',
            mode = { 'n', 'v' },
            '<cmd>MCstart<cr>',
            { desc = 'MCstart' },
        },
    },
}
