return {
    {
        'kdheepak/lazygit.nvim',
        cmd = {
            'LazyGit',
            'LazyGitConfig',
            'LazyGitCurrentFile',
            'LazyGitFilter',
            'LazyGitFilterCurrentFile',
        },
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        keys = {
            { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'Git: LazyGit' },
        },
    },
    {
        'lewis6991/gitsigns.nvim',
        event = 'VeryLazy',
        config = function()
            require('gitsigns').setup({
                on_attach = function(bufnr)
                    local gitsigns = require('gitsigns')

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', ']g', function()
                        if vim.wo.diff then
                            vim.cmd.normal({ ']g', bang = true })
                        else
                            gitsigns.nav_hunk('next')
                        end
                    end, { desc = 'Git: Next Hunk' })

                    map('n', '[g', function()
                        if vim.wo.diff then
                            vim.cmd.normal({ '[g', bang = true })
                        else
                            gitsigns.nav_hunk('prev')
                        end
                    end, { desc = 'Git: Pre Hunk' })

                    -- Actions
                    -- stylua: ignore start
                    map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Git: Stage Hunk' })
                    map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Git: Reset Hunk' })
                    map('v', '<leader>hs', function() gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, { desc = 'Git: Stage Hunk' })
                    map('v', '<leader>hr', function() gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, { desc = 'Git: Reset Hunk' })
                    map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Git: State Buffer' })
                    map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = 'Git: Undo Stage Hunk' })
                    map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Git: Reset Buffer' })
                    map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Git: Preview Hunk' })
                    map('n', '<leader>hb', function() gitsigns.blame_line({ full = true }) end, { desc = 'Git: Blame Line' })
                    map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Git: Toggle Current Line Blame' })
                    map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Git: Diff This' })
                    map('n', '<leader>hD', function() gitsigns.diffthis('~') end, { desc = 'Git: Diff This ~' })
                    map('n', '<leader>td', gitsigns.toggle_deleted, { desc = 'Git: Toggle Deleted' })
                    -- stylua: ignore end

                    -- Text object
                    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<cr>', { silent = true, desc = 'Git: Select Hunk' })
                end,
            })
        end,
    },
}
