local M = {}

function M.BufOnly(buffer, bang)
    local buffer_num

    if buffer == '' then
        -- No buffer provided, use the current buffer.
        buffer_num = vim.fn.bufnr('%')
    elseif tonumber(buffer) then
        -- A buffer number was provided.
        buffer_num = vim.fn.bufnr(tonumber(buffer))
    else
        -- A buffer name was provided.
        buffer_num = vim.fn.bufnr(buffer)
    end

    if buffer_num == -1 then
        vim.api.nvim_echo({ { 'No matching buffer for ' .. buffer, 'ErrorMsg' } }, true, {})
        return
    end

    local last_buffer = vim.fn.bufnr('$')
    local delete_count = 0
    local n = 1

    while n <= last_buffer do
        if n ~= buffer_num and vim.fn.buflisted(n) == 1 then
            if bang == '' and vim.fn.getbufvar(n, '&modified') == 1 then
                vim.api.nvim_echo({ { 'No write since last change for buffer ' .. n .. ' (add ! to override)', 'ErrorMsg' } }, true, {})
            else
                vim.cmd('silent! bdel' .. bang .. ' ' .. n)
                if vim.fn.buflisted(n) == 0 then
                    delete_count = delete_count + 1
                end
            end
        end
        n = n + 1
    end

    if delete_count == 1 then
        vim.api.nvim_echo({ { delete_count .. ' buffer deleted', 'None' } }, true, {})
    elseif delete_count > 1 then
        vim.api.nvim_echo({ { delete_count .. ' buffers deleted', 'None' } }, true, {})
    end
end

return M
