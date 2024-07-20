return {
    {
        'CopilotC-Nvim/CopilotChat.nvim',
        branch = 'canary',
        dependencies = {
            { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
            { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
        },
        config = function()
            vim.keymap.set({ 'n' }, '<leader>cct', '<cmd>CopilotChatToggle<cr>')
            vim.keymap.set({ 'n' }, '<leader>ccr', '<cmd>CopilotChatReset<cr>')
            vim.keymap.set({ 'n' }, '<leader>ccs', '<cmd>CopilotChatStop<cr>')
            vim.keymap.set({ 'n' }, '<leader>ccc', '<cmd>CopilotChatCommit<cr>')
            vim.keymap.set({ 'n' }, '<leader>ccC', '<cmd>CopilotChatCommitStaged<cr>')
            vim.keymap.set({ 'n', 'v' }, '<leader>cce', '<cmd>CopilotChatExplain<cr>')
            vim.keymap.set({ 'n', 'v' }, '<leader>ccR', '<cmd>CopilotChatReview<cr>')
            vim.keymap.set({ 'n', 'v' }, '<leader>ccf', '<cmd>CopilotChatFix<cr>')
            vim.keymap.set({ 'n', 'v' }, '<leader>ccF', '<cmd>CopilotChatFixDiagnostic<cr>')
            vim.keymap.set({ 'n', 'v' }, '<leader>cco', '<cmd>CopilotChatOptimize<cr>')
            vim.keymap.set({ 'n', 'v' }, '<leader>ccd', '<cmd>CopilotChatDocs<cr>')
            vim.keymap.set({ 'n', 'v' }, '<leader>cct', '<cmd>CopilotChatTests<cr>')
            vim.keymap.set({ 'n', 'v' }, '<leader>ccq', function()
                local input = vim.fn.input('Quick Chat: ')
                if input ~= '' then
                    require('CopilotChat').ask(input, { selection = require('CopilotChat.select').buffer })
                end
            end, { desc = 'CopilotChat - Quick chat' })
            -- vim.keymap.set({ 'n', 'v' }, '<leader>cch', function()
            --     local actions = require('CopilotChat.actions')
            --     require('CopilotChat.integrations.telescope').pick(actions.help_actions())
            -- end, { desc = 'CopilotChat - Help actions' })
            vim.keymap.set({ 'n', 'v' }, '<leader>ccp', function()
                local actions = require('CopilotChat.actions')
                require('CopilotChat.integrations.telescope').pick(actions.prompt_actions())
            end, { desc = 'CopilotChat - Prompt actions' })

            -- cmp
            require('CopilotChat.integrations.cmp').setup()
            require('CopilotChat').setup({
                debug = true, -- Enable debugging
                window = {
                    layout = 'float',
                    relative = 'cursor',
                    width = 1,
                    height = 0.4,
                    row = 1,
                },
                mappings = {
                    complete = {
                        detail = 'Use @<Tab> or /<Tab> for options.',
                        insert = '<Tab>',
                    },
                    close = {
                        normal = 'q',
                        insert = '<C-c>',
                    },
                    reset = {
                        normal = '<C-r>',
                        insert = '<C-r>',
                    },
                    submit_prompt = {
                        normal = '<CR>',
                        insert = '<C-s>',
                    },
                    accept_diff = {
                        normal = '<M-y>',
                        insert = '<M-y>',
                    },
                    yank_diff = {
                        normal = 'gy',
                    },
                    show_diff = {
                        normal = 'gd',
                    },
                    show_system_prompt = {
                        normal = 'gp',
                    },
                    show_user_selection = {
                        normal = 'gs',
                    },
                },
            })
        end,
    },
    {
        'zbirenbaum/copilot.lua',
        cmd = 'Copilot',
        event = 'InsertEnter',
        config = function()
            require('copilot').setup({
                panel = {
                    enabled = true,
                    auto_refresh = false,
                    keymap = {
                        jump_prev = '[[',
                        jump_next = ']]',
                        accept = '<CR>',
                        refresh = 'gr',
                        open = '<M-CR>',
                    },
                    layout = {
                        position = 'right', -- | top | left | right
                        ratio = 0.4,
                    },
                },
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    hide_during_completion = true,
                    debounce = 75,
                    keymap = {
                        accept = '<M-l>',
                        accept_word = false,
                        accept_line = false,
                        next = '<M-]>',
                        prev = '<M-[>',
                        dismiss = '<C-]>',
                    },
                },
            })

            local cmp = require('cmp')
            cmp.event:on('menu_opened', function()
                vim.b.copilot_suggestion_hidden = true
            end)

            cmp.event:on('menu_closed', function()
                vim.b.copilot_suggestion_hidden = false
            end)
        end,
    },
}
