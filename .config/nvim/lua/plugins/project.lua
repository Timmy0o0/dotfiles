return {
    'coffebar/neovim-project',
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope.nvim', tag = '0.1.4' },
        { 'Shatur/neovim-session-manager' },
    },
    config = function()
        vim.opt.sessionoptions:append('globals')
        vim.api.nvim_set_keymap('n', '<leader>p', '<cmd>Telescope neovim-project history<cr>', { desc = 'Telescope: Find recent projects' })
        vim.api.nvim_set_keymap('n', '<leader>fp', '<cmd>Telescope neovim-project discover<cr>', { desc = 'Telescope: Find projects' })
        require('neovim-project').setup({
            projects = { -- define project roots
                '~/projects/*',
                '~/workspace/*',
                '~/.config/*',
            },
        })
    end,
}
