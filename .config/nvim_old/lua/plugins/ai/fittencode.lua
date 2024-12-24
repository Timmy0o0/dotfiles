return {
    'luozhiya/fittencode.nvim',
    event = 'InsertEnter',
    config = function()
        require('fittencode').setup({
            completion_mode = 'source',
        })
    end,
}
