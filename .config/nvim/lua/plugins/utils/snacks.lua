return {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = true },
        dim = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scroll = { enabled = false },
        indent = {
            enabled = true,
            scope = {
                enabled = true, -- enable highlighting the current scope
                priority = 200,
                char = '╎',
                underline = false, -- underline the start of the scope
                only_current = false, -- only show scope in the current window
                hl = 'SnacksIndentScope', ---@type string|string[] hl group for scopes
            },
        },
    },
    init = function()
        vim.api.nvim_create_autocmd('User', {
            pattern = 'VeryLazy',
            callback = function()
                -- Create some toggle mappings
                -- Snacks.toggle.option('spell', { name = 'Spelling' }):map('<leader>us')
                Snacks.toggle.dim():map('<leader>ud')
            end,
        })
    end,
}
