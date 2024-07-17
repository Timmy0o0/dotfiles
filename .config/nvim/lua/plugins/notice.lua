return {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
        'MunifTanjim/nui.nvim',
        'rcarriga/nvim-notify',
    },
    config = function()
        vim.keymap.set({ 'n', 'i', 's' }, '<c-d>', function()
            if not require('noice.lsp').scroll(4) then
                return '<c-d>'
            end
        end, { silent = true, expr = true })

        vim.keymap.set({ 'n', 'i', 's' }, '<c-u>', function()
            if not require('noice.lsp').scroll(-4) then
                return '<c-u>'
            end
        end, { silent = true, expr = true })

        require('noice').setup({
            messages = {
                enabled = false,
                view = 'notify',
                view_error = 'notify',
                view_warn = 'notify',
                view_history = 'messages',
                view_search = 'virtualtext',
            },
            lsp = {
                progress = {
                    enabled = false,
                },
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                    ['vim.lsp.util.stylize_markdown'] = true,
                    ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
                },
            },
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = true,
                command_palette = false,
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = false,
            },
        })
    end,
}
