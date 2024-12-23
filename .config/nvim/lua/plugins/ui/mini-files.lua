return {
    'echasnovski/mini.files',
    event = 'VeryLazy',
    config = function()
        require('mini.files').setup()
        vim.keymap.set({ 'n' }, '<C-e>', '<cmd>lua MiniFiles.open()<cr>')
    end,
}
