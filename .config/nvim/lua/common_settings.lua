local option = vim.opt
local buffer = vim.b
local global = vim.g

-- Global Settings --
option.showmode = false
option.backspace = { "indent", "eol", "start" }
option.tabstop = 4
option.shiftwidth = 4
option.expandtab = true
option.shiftround = true
option.autoindent = true
option.smartindent = true
option.number = true
option.relativenumber = true
option.wildmenu = true
option.hlsearch = false
option.ignorecase = true
option.smartcase = true
option.completeopt = { "menu", "menuone" }
option.cursorline = true
option.termguicolors = true
option.signcolumn = "yes"
option.autoread = true
option.title = true
option.swapfile = false
option.backup = false
option.updatetime = 50
option.mouse = "a"
option.undofile = true
option.undodir = vim.fn.expand('$HOME/.local/share/nvim/undo')
option.exrc = true
option.wrap = false
option.splitright = true
option.list = true
option.listchars:append("space:·")
option.scrolloff = 15
-- keymap zc zo zm zr zM zR
-- option.nofoldenable = true
option.foldmethod = 'expr'
option.foldexpr = 'nvim_treesitter#foldexpr()'
option.foldenable = false
-- highlight search
vim.o.hlsearch = true
vim.keymap.set("n", "<C-n>", "<cmd>nohlsearch<CR>")

-- conf for neovide
if vim.g.neovide then
    option.guifont = "SauceCodePro Nerd Font"

    vim.api.nvim_set_keymap('n', '<M-CR>', ':lua ToggleFullscreen()<CR>', { noremap = true, silent = false })
    function ToggleFullscreen()
        if vim.g.neovide_fullscreen == true then
            vim.g.neovide_fullscreen = false
        else
            vim.g.neovide_fullscreen = true
        end
    end
end


-- Buffer Settings --
buffer.fileenconding = "utf-8"

-- Global Settings --
global.mapleader = " "

if vim.fn.has('wsl') == 1 then
    vim.g.clipboard = {
    name = 'win32yank-wsl',
    copy = {
        ['+'] = 'clip.exe',
        ['*'] = 'clip.exe',
    },
    paste = {
        ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
}
end

-- Key mappings --
vim.keymap.set({ "n", "i", "v" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Right>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Down>", "<Nop>")

vim.keymap.set({ "n" }, "<C-r>", ":source<cr>")

vim.keymap.set({ "n" }, "Q", ":q<cr>")
vim.keymap.set({ "n" }, "W", ":w<cr>", { noremap = true, silent = true })
vim.keymap.set('i', 'jj', "<Esc>", { noremap = true, silent = true })

vim.keymap.set({ "n", "v" }, "<C-y>", "\"+y", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<C-p>", "\"+p", { noremap = true, silent = true })
vim.keymap.set("c", "<C-v>", "<C-R>+")
-- maybe paste use ctrl shift v in insert mode
vim.keymap.set("i", "<C-v>", "<C-R>+")

vim.keymap.set({ "n" }, ">", ">>")
vim.keymap.set({ "n" }, "<", "<<")
vim.keymap.set({ "v" }, ">", ">gv")
vim.keymap.set({ "v" }, "<", "<gv")

-- movement
vim.keymap.set({ "n", "v" }, "H", "0")
vim.keymap.set({ "n", "v" }, "L", "$")
vim.keymap.set({ "n", "v" }, "dH", "d0")
vim.keymap.set({ "n", "v" }, "dL", "d$")

vim.keymap.set({ "n", "v" }, "J", "5j")
vim.keymap.set({ "n", "v" }, "K", "5k")

vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")

-- split and rotate
vim.keymap.set({ "n" }, "sj", ":split<cr>")
vim.keymap.set({ "n" }, "sl", ":vsplit<cr>")
vim.keymap.set({ "n" }, "<C-Left>", "<C-w>b<C-w>K")
vim.keymap.set({ "n" }, "<C-Right>", "<C-w>b<C-w>H")

vim.keymap.set({ "n" }, "<C-j>", "<C-w>j")
vim.keymap.set({ "n" }, "<C-k>", "<C-w>k")
vim.keymap.set({ "n" }, "<C-h>", "<C-w>h")
vim.keymap.set({ "n" }, "<C-l>", "<C-w>l")

vim.keymap.set({ "n" }, "<Left>", "<C-w>>")
vim.keymap.set({ "n" }, "<Right>", "<C-w><")
vim.keymap.set({ "n" }, "<Up>", "<C-w>-")
vim.keymap.set({ "n" }, "<Down>", "<C-w>+")


-- close other window and buffer
vim.keymap.set("n", "<leader>j", "<cmd>bNext<CR>")
vim.keymap.set("n", "<leader>k", "<cmd>bprevious<CR>")
vim.keymap.set("n", "<leader>nn", "<cmd>bd<CR>")
vim.keymap.set("n", "<leader>nc", "<cmd>only<CR>")
vim.keymap.set("n", "<leader>nC", "<cmd>%bd|e#<CR>")
