return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'radyz/telescope-gitsigns',
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
        },
    },
    config = function()
        require('telescope').setup({
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = 'smart_case',
                },
            },

            defaults = {
                mappings = {
                    i = {
                        ['<C-j>'] = require('telescope.actions').move_selection_next,
                        ['<C-k>'] = require('telescope.actions').move_selection_previous,
                        ['<C-l>'] = require('telescope.actions').select_default,
                    },
                    n = {
                        ['<C-j>'] = require('telescope.actions').move_selection_next,
                        ['<C-k>'] = require('telescope.actions').move_selection_previous,
                        ['<C-l>'] = require('telescope.actions').select_default,
                    },
                },
            },

            -- stylua: ignore
            pickers = {
                find_files = {
                    find_command = { 'rg', '--files', '--hidden',
                        '--glob', '!.git/',
                        '--glob', '!.local/',
                        '--glob', '!.npm/',
                        '--glob', '!.virtualenvs/',
                        '--glob', '!.oh-my-zsh/',
                        '--glob', '!.cache/' },
                }
            },
        })

        require('telescope').load_extension('git_signs')
        require('telescope').load_extension('fzf')
        local builtin = require('telescope.builtin')
        -- stylua: ignore start
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope: Find files' })
        vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = 'Telescope: Find live grep' })
        vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = 'Telescope: Find opened buffers' })
        vim.keymap.set('n', '<leader>?', builtin.help_tags, { desc = 'Telescope: Find help files' })
        vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Telescope: Find lsp diagnostics' })
        vim.keymap.set('n', '<leader>fg', builtin.git_status, { desc = 'Telescope: Find git status files' })
        vim.keymap.set('n', '<leader>fh', "<cmd>Telescope git_signs<cr>", { desc = 'Telescope: Find git_signs' })
        -- stylua: ignore end
        vim.keymap.set('n', '<leader>/', function()
            require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
                winblend = 0,
                previewer = false,
            }))
        end, { desc = 'Telescope: Fuzzily search in current buffer' })
    end,
}
