local is_mac = vim.fn.has('macunix') == 1

if vim.g.neovide then
    if is_mac then
        -- option.guifont = "SauceCodePro Nerd Font:h18"
        -- option.guifont = "FiraCode Nerd Font:h18"
        -- option.guifont = "JetBrainsMono Nerd Font,Noto Color Emoji:h18"
        vim.opt.guifont = 'JetBrainsMono Nerd Font:h18'
    else
        -- option.guifont = "SauceCodePro Nerd Font:h13"
        -- option.guifont = "FiraCode Nerd Font:h13"
        vim.opt.guifont = 'JetBrainsMono Nerd Font,Segoe UI Emoji:h14'
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
