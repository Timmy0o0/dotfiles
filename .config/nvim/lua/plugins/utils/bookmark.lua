return {
    'tomasky/bookmarks.nvim',
    event = 'VimEnter',
    config = function()
        require('telescope').load_extension('bookmarks')
        vim.keymap.set({ 'n' }, '<leader>fm', '<cmd>Telescope bookmarks list<cr>')

        require('bookmarks').setup({
            sign_priority = 8,
            save_file = vim.fn.expand('$HOME/.bookmarks'),
            keywords = {
                ['@t'] = ' ', -- mark annotation startswith @t ,signs this icon as `Todo`
                ['@w'] = ' ', -- mark annotation startswith @w ,signs this icon as `Warn`
                ['@f'] = ' ', -- mark annotation startswith @f ,signs this icon as `Fix`
                ['@n'] = ' ', -- mark annotation startswith @n ,signs this icon as `Note`
            },
            -- stylua: ignore
            signs = {
                add = { hl = 'BookMarksAdd', text = '', numhl = 'BookMarksAddNr', linehl = 'BookMarksAddLn' },
                ann = { hl = 'BookMarksAnn', text = '♥', numhl = 'BookMarksAnnNr', linehl = 'BookMarksAnnLn' },
            },

            ---@diagnostic disable-next-line: unused-local
            on_attach = function(bufnr)
                local bm = require('bookmarks')
                local map = vim.keymap.set
                map('n', 'mm', bm.bookmark_toggle, { desc = 'Bookmark: add or remove bookmark' })
                map('n', 'mi', bm.bookmark_ann, { desc = 'Bookmark: add or edit anno mark' })
                map('n', 'mc', bm.bookmark_clean, { desc = 'Bookmark: clean all marks in local buffer' })
                map('n', ']b', bm.bookmark_next, { desc = 'Bookmark: Next bookmark' })
                map('n', '[b', bm.bookmark_prev, { desc = 'Bookmark: Prev bookmark' })
                map('n', 'ml', bm.bookmark_list, { desc = 'Bookmark: show marked file list' })
                map('n', 'mx', bm.bookmark_clear_all, { desc = 'bookmark: remove all bookmarks' })
            end,
        })
    end,
}
