return {
    -- {
    --     'ahmedkhalf/project.nvim',
    --     config = function()
    --         require('project_nvim').setup({
    --             -- your configuration comes here
    --             -- or leave it empty to use the default settings
    --             -- refer to the configuration section below
    --             -- Manual mode doesn't automatically change your root directory, so you have
    --             -- the option to manually do so using `:ProjectRoot` command.
    --             manual_mode = false,
    --
    --             -- Methods of detecting the root directory. **"lsp"** uses the native neovim
    --             -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
    --             -- order matters: if one is not detected, the other is used as fallback. You
    --             -- can also delete or rearangne the detection methods.
    --             detection_methods = { 'lsp', 'pattern' },
    --
    --             -- All the patterns used to detect root dir, when **"pattern"** is in
    --             -- detection_methods
    --             patterns = {
    --                 '.git',
    --                 '_darcs',
    --                 '.hg',
    --                 '.bzr',
    --                 '.svn',
    --                 'Makefile',
    --                 'package.json',
    --                 '.nvim.lua',
    --                 '.neoconf.json',
    --             },
    --
    --             -- Table of lsp clients to ignore by name
    --             -- eg: { "efm", ... }
    --             ignore_lsp = {},
    --
    --             -- Don't calculate root dir on specific directories
    --             -- Ex: { "~/.cargo/*", ... }
    --             exclude_dirs = {},
    --
    --             -- Show hidden files in telescope
    --             show_hidden = false,
    --
    --             -- When set to false, you will get a message when project.nvim changes your
    --             -- directory.
    --             silent_chdir = true,
    --
    --             -- What scope to change the directory, valid options are
    --             -- * global (default)
    --             -- * tab
    --             -- * win
    --             scope_chdir = 'global',
    --
    --             -- Path where project.nvim will store the project history for use in
    --             -- telescope
    --             datapath = vim.fn.stdpath('data'),
    --
    --             vim.api.nvim_set_keymap(
    --                 'n',
    --                 '<leader>p',
    --                 '<cmd>Telescope projects<cr>',
    --                 { desc = 'Telescope: Find projects' }
    --             ),
    --         })
    --     end,
    -- },
    {
        {
            'coffebar/neovim-project',
            dependencies = {
                { 'nvim-lua/plenary.nvim' },
                { 'nvim-telescope/telescope.nvim', tag = '0.1.4' },
                { 'Shatur/neovim-session-manager' },
            },
            config = function()
                vim.opt.sessionoptions:append('globals')
                vim.api.nvim_set_keymap(
                    'n',
                    '<leader>p',
                    '<cmd>Telescope neovim-project history<cr>',
                    { desc = 'Telescope: Find recent projects' }
                )
                vim.api.nvim_set_keymap(
                    'n',
                    '<leader>fp',
                    '<cmd>Telescope neovim-project discover<cr>',
                    { desc = 'Telescope: Find projects' }
                )
                require('neovim-project').setup({
                    projects = { -- define project roots
                        '~/projects/*',
                        '~/workspace/*',
                        '~/.config/*',
                    },
                })
            end,
        },
    },
}
