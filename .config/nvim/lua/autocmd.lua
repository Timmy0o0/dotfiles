-- YankHighlight
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=200}
  augroup end
]]


-- Scorolloff not be respected near end of file
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "BufEnter" }, {
    group = vim.api.nvim_create_augroup("ScrollOffEOF", {}),
    callback = function()
        local win_h = vim.api.nvim_win_get_height(0)
        local off = math.min(vim.o.scrolloff, math.floor(win_h / 2))
        local dist = vim.fn.line "$" - vim.fn.line "."
        local rem = vim.fn.line "w$" - vim.fn.line "w0" + 1
        if dist < off and win_h - rem + dist < off then
            local view = vim.fn.winsaveview()
            view.topline = view.topline + off - (win_h - rem + dist)
            vim.fn.winrestview(view)
        end
    end,
})


-- Auto Load proj conf
function ReloadProjectConfig()
    local cwd = vim.fn.getcwd()
    -- local config_files = { ".nvim.lua", ".nvimrc.lua", ".vim.lua", ".neoconf.json" }
    local config_files = { ".nvim.lua", ".nvimrc.lua", ".vim.lua" }
    for _, config_file in ipairs(config_files) do
        local full_path = cwd .. "/" .. config_file
        if vim.fn.filereadable(full_path) == 1 then
            vim.cmd('luafile ' .. full_path)
            print("Loaded project config: " .. full_path)
            return
        end
    end
    print("No project-specific config found, using default")
end

vim.api.nvim_create_autocmd("DirChanged", {
    pattern = "*",
    callback = function()
        ReloadProjectConfig()
    end,
})

-- ReloadProjectConfig()
