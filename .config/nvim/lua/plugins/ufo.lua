return {
    'kevinhwang91/nvim-ufo',
    dependencies = {
        'kevinhwang91/promise-async',
        'luukvbaal/statuscol.nvim',
    },
    config = function()
        vim.o.foldcolumn = '1'
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true
        -- unicode
        vim.opt.fillchars:append({
            fold = ' ',
            foldopen = '▼',
            foldsep = ' ',
            foldclose = '▶',
        })
        -- vim.opt.fillchars:append({
        --     fold = ' ',
        --     foldopen = '●',
        --     foldsep = ' ',
        --     foldclose = '○',
        -- })

        vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
        vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
        vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
        vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
        vim.keymap.set('n', 'zk', require('ufo').peekFoldedLinesUnderCursor)

        -- remove the foldlevel number
        local builtin = require('statuscol.builtin')
        require('statuscol').setup({
            relculright = true,
            segments = {
                { text = { builtin.foldfunc }, click = 'v:lua.ScFa' },
                { text = { '%s' }, click = 'v:lua.ScSa' },
                {
                    text = { builtin.lnumfunc, ' ' },
                    condition = { true, builtin.not_empty },
                    click = 'v:lua.ScLa',
                },
            },
        })

        -- line number handler
        local handler = function(virtText, lnum, endLnum, width, truncate)
            local newVirtText = {}
            local suffix = ('  󱞡 %d lines '):format(endLnum - lnum)
            local sufWidth = vim.fn.strdisplaywidth(suffix)
            local targetWidth = width - sufWidth
            local curWidth = 0
            for _, chunk in ipairs(virtText) do
                local chunkText = chunk[1]
                local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                if targetWidth > curWidth + chunkWidth then
                    table.insert(newVirtText, chunk)
                else
                    chunkText = truncate(chunkText, targetWidth - curWidth)
                    local hlGroup = chunk[2]
                    table.insert(newVirtText, { chunkText, hlGroup })
                    chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    -- str width returned from truncate() may less than 2nd argument, need padding
                    if curWidth + chunkWidth < targetWidth then
                        suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                    end
                    break
                end
                curWidth = curWidth + chunkWidth
            end
            table.insert(newVirtText, { suffix, 'MoreMsg' })
            return newVirtText
        end

        require('ufo').setup({
            provider_selector = function()
                return { 'lsp', 'indent' }
            end,
            fold_virt_text_handler = handler,
        })
    end,
}
