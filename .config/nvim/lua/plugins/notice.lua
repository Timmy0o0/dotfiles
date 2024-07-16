return {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
        messages = {
            enabled = false,
            view = 'notify',
            view_error = 'notify',
            view_warn = 'notify',
            view_history = 'messages',
            view_search = 'virtualtext',
        },
    },
    dependencies = {
        'MunifTanjim/nui.nvim',
        'rcarriga/nvim-notify',
    },
}
