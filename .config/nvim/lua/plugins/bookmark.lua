return {
    'tom-anders/telescope-vim-bookmarks.nvim',
    event = 'VeryLazy',
    dependencies = {
        'MattesGroeger/vim-bookmarks',
    },
    config = function()
        vim.cmd([[highlight BookmarkSign ctermbg=NONE ctermfg=160]])
        vim.cmd([[highlight BookmarkLine ctermbg=194 ctermfg=NONE]])
        vim.g.bookmark_sign = '♥'
        vim.g.bookmark_highlight_lines = 1

        require('telescope').load_extension('vim_bookmarks')

        vim.keymap.set(
            { 'n' },
            '<leader>fm',
            '<cmd>lua require("telescope").extensions.vim_bookmarks.all()<cr>'
        )
        vim.keymap.set(
            { 'n' },
            '<leader>fM',
            '<cmd>lua require("telescope").extensions.vim_bookmarks.current_file()<cr>'
        )
    end,

    -- keymap
    -- mm | Add/remove bookmark at current line
    -- mi | Add/edit/remove annotation at current line
    -- mn | Jump to next bookmark in buffer
    -- mp | Jump to previous bookmark in buffer
    -- ma | Show all bookmarks (toggle)
    -- mc | Clear bookmarks in current buffer only
    -- mx | Clear bookmarks in all buffers
    -- [count]mkk | Move up bookmark at current line
    -- [count]mjj | Move down bookmark at current line
    -- [count]mg | Move bookmark at current line to another line
    --
}
