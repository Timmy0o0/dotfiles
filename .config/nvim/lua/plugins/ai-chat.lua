return {
    {
        'yetone/avante.nvim',
        event = 'VeryLazy',
        lazy = false,
        version = false, -- set this if you want to always pull the latest change
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = 'make',
        -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'stevearc/dressing.nvim',
            'nvim-lua/plenary.nvim',
            'MunifTanjim/nui.nvim',
            --- The below dependencies are optional,
            'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
            -- 'zbirenbaum/copilot.lua', -- for providers='copilot'
            {
                -- support for image pasting
                'HakonHarnes/img-clip.nvim',
                event = 'VeryLazy',
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        -- required for Windows users
                        use_absolute_path = true,
                    },
                },
            },
            {
                -- Make sure to set this up properly if you have lazy=true
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { 'markdown', 'Avante' },
                },
                ft = { 'markdown', 'Avante' },
            },
        },
        config = function()
            require('avante').setup({
                -- add any opts here
                ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
                provider = 'claude', -- Recommend using Claude
                -- auto_suggestions_provider = 'claude', -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
                -- provider = 'copilot',
                auto_suggestions_provider = 'copilot', -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
                -- claude = {
                --     endpoint = 'https://api.anthropic.com',
                --     model = 'claude-3-5-sonnet-20241022',
                --     temperature = 0,
                --     max_tokens = 4096,
                -- },
                copilot = {
                    endpoint = 'https://api.githubcopilot.com',
                    model = 'gpt-4o-2024-05-13',
                    -- model = 'claude-3.5-sonnet',
                    -- proxy = nil, -- [protocol://]host[:port] Use this proxy
                    -- proxy = 'http://127.0.0.1:10809', -- [protocol://]host[:port] Use this proxy
                    allow_inseclaudecure = false, -- Allow insecure server connections
                    timeout = 30000, -- Timeout in milliseconds
                    temperature = 0,
                    max_tokens = 4096,
                },
                behaviour = {
                    auto_suggestions = false, -- Experimental stage
                    auto_set_highlight_group = true,
                    auto_set_keymaps = true,
                    auto_apply_diff_after_generation = false,
                    support_paste_from_clipboard = false,
                },
                mappings = {
                    --- @class AvanteConflictMappings
                    diff = {
                        ours = 'co',
                        theirs = 'ct',
                        all_theirs = 'ca',
                        both = 'cb',
                        cursor = 'cc',
                        next = ']x',
                        prev = '[x',
                    },
                    suggestion = {
                        accept = '<M-l>',
                        next = '<M-]>',
                        prev = '<M-[>',
                        dismiss = '<C-]>',
                    },
                    jump = {
                        next = ']]',
                        prev = '[[',
                    },
                    submit = {
                        normal = '<CR>',
                        insert = '<C-s>',
                    },
                    sidebar = {
                        apply_all = 'A',
                        apply_cursor = 'a',
                        switch_windows = '<Tab>',
                        reverse_switch_windows = '<S-Tab>',
                    },
                },
                hints = { enabled = true },
                windows = {
                    ---@type "right" | "left" | "top" | "bottom"
                    position = 'right', -- the position of the sidebar
                    wrap = true, -- similar to vim.o.wrap
                    width = 30, -- default % based on available width
                    sidebar_header = {
                        enabled = true, -- true, false to enable/disable the header
                        align = 'center', -- left, center, right for title
                        rounded = true,
                    },
                    input = {
                        prefix = '> ',
                        height = 8, -- Height of the input window in vertical layout
                    },
                    edit = {
                        border = 'rounded',
                        start_insert = true, -- Start insert mode when opening the edit window
                    },
                    ask = {
                        floating = false, -- Open the 'AvanteAsk' prompt in a floating window
                        start_insert = true, -- Start insert mode when opening the ask window
                        border = 'rounded',
                        ---@type "ours" | "theirs"
                        focus_on_apply = 'ours', -- which diff to focus after applying
                    },
                },
                highlights = {
                    ---@type AvanteConflictHighlights
                    diff = {
                        current = 'DiffText',
                        incoming = 'DiffAdd',
                    },
                },
                --- @class AvanteConflictUserConfig
                diff = {
                    autojump = true,
                    ---@type string | fun(): any
                    list_opener = 'copen',
                    --- Override the 'timeoutlen' setting while hovering over a diff (see :help timeoutlen).
                    --- Helps to avoid entering operator-pending mode with diff mappings starting with `c`.
                    --- Disable by setting to -1.
                    override_timeoutlen = 500,
                },
            })
        end,
    },
    {
        'CopilotC-Nvim/CopilotChat.nvim',
        branch = 'canary',
        dependencies = {
            { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
            { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
        },
        config = function()
            vim.keymap.set({ 'n' }, '<leader>ccr', '<cmd>CopilotChatReset<cr>')
            vim.keymap.set({ 'n' }, '<leader>ccs', '<cmd>CopilotChatStop<cr>')
            vim.keymap.set({ 'n' }, '<leader>ccc', '<cmd>CopilotChatCommit<cr>')
            vim.keymap.set({ 'n' }, '<leader>ccC', '<cmd>CopilotChatCommitStaged<cr>')
            vim.keymap.set({ 'n', 'v' }, '<leader>cct', '<cmd>CopilotChatToggle<cr>')
            vim.keymap.set({ 'n', 'v' }, '<leader>cce', '<cmd>CopilotChatExplain<cr>')
            vim.keymap.set({ 'n', 'v' }, '<leader>ccR', '<cmd>CopilotChatReview<cr>')
            vim.keymap.set({ 'n', 'v' }, '<leader>ccf', '<cmd>CopilotChatFix<cr>')
            vim.keymap.set({ 'n', 'v' }, '<leader>ccF', '<cmd>CopilotChatFixDiagnostic<cr>')
            vim.keymap.set({ 'n', 'v' }, '<leader>cco', '<cmd>CopilotChatOptimize<cr>')
            vim.keymap.set({ 'n', 'v' }, '<leader>ccd', '<cmd>CopilotChatDocs<cr>')
            vim.keymap.set({ 'n', 'v' }, '<leader>ccT', '<cmd>CopilotChatTests<cr>')
            vim.keymap.set({ 'n', 'v' }, '<leader>ccq', function()
                local input = vim.fn.input('Quick Chat: ')
                if input ~= '' then
                    require('CopilotChat').ask(input, { selection = require('CopilotChat.select').buffer })
                end
            end, { desc = 'CopilotChat - Quick chat' })
            vim.keymap.set({ 'n', 'v' }, '<leader>cch', function()
                local actions = require('CopilotChat.actions')
                require('CopilotChat.integrations.telescope').pick(actions.help_actions())
            end, { desc = 'CopilotChat - Help actions' })
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
