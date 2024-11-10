local is_mac = vim.fn.has('macunix') == 1
local is_win = vim.fn.has('win32') == 1

if vim.g.neovide then
    if is_mac then
        -- option.guifont = "SauceCodePro Nerd Font:h18"
        -- option.guifont = "FiraCode Nerd Font:h18"
        vim.opt.guifont = 'JetBrainsMono Nerd Font:h18'
    elseif is_win then
        vim.opt.guifont = 'JetBrainsMono Nerd Font,Segoe UI Emoji:h14'
    else
        vim.opt.guifont = 'JetBrainsMono Nerd Font,Noto Color Emoji:h14'
    end

    vim.g.neovide_transparency = 0.95
    vim.api.nvim_set_keymap('n', '<M-CR>', '<cmd>lua ToggleFullscreen()<cr>', { noremap = true })
    function ToggleFullscreen()
        if vim.g.neovide_fullscreen == true then
            vim.g.neovide_fullscreen = false
        else
            vim.g.neovide_fullscreen = true
        end
    end
end
