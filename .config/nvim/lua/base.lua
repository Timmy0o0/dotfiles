local option = vim.opt
local buffer = vim.b
local global = vim.g

-- Global Settings --
option.showmode = false
option.backspace = { 'indent', 'eol', 'start' }
option.tabstop = 4
option.shiftwidth = 2
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
option.completeopt = { 'menu', 'menuone' }
option.cursorline = true
option.termguicolors = true
option.signcolumn = 'yes'
option.autoread = true
option.title = true
option.swapfile = false
option.backup = false
option.updatetime = 50
option.mouse = 'a'
option.undofile = true
option.undodir = vim.fn.expand('$HOME/.local/share/nvim/undo')
option.exrc = true
option.wrap = false
option.splitbelow = true
option.list = true
option.listchars:append('space:·')
option.scrolloff = 15
-- highlight search
vim.o.hlsearch = true
vim.keymap.set('n', '<C-n>', '<cmd>nohlsearch<cr>')

-- Buffer Settings --
buffer.fileenconding = 'utf-8'

-- Global Settings --
global.mapleader = ' '

-- Key mappings --
vim.keymap.set({ 'n', 'i', 'v' }, '<Left>', '<Nop>')
vim.keymap.set({ 'n', 'i', 'v' }, '<Right>', '<Nop>')
vim.keymap.set({ 'n', 'i', 'v' }, '<Up>', '<Nop>')
vim.keymap.set({ 'n', 'i', 'v' }, '<Down>', '<Nop>')

vim.keymap.set({ 'n' }, '<C-r>', '<cmd>source<cr>')

vim.keymap.set({ 'n' }, '<C-q>', '<cmd>quitall<cr>')
vim.keymap.set({ 'n' }, 'W', '<cmd>w<cr>', { noremap = true })
-- vim.keymap.set('i', 'jj', "<Esc>", { noremap = true })

vim.keymap.set({ 'n', 'v' }, '<C-y>', '"+y', { noremap = true })
vim.keymap.set({ 'n', 'v' }, '<C-p>', '"+p', { noremap = true })
vim.keymap.set({ 'c', 'i' }, '<C-v>', '<C-R>+')

vim.keymap.set({ 'n' }, '>', '>>')
vim.keymap.set({ 'n' }, '<', '<<')
vim.keymap.set({ 'v' }, '>', '>gv')
vim.keymap.set({ 'v' }, '<', '<gv')

-- movement
vim.keymap.set({ 'n', 'v' }, 'H', '0')
vim.keymap.set({ 'n', 'v' }, 'L', '$')
vim.keymap.set({ 'n', 'v' }, 'dH', 'd0')
vim.keymap.set({ 'n', 'v' }, 'dL', 'd$')

vim.keymap.set({ 'n', 'v' }, 'J', '5j')
vim.keymap.set({ 'n', 'v' }, 'K', '5k')

vim.keymap.set('v', '<C-k>', ":m '<-2<cr>gv=gv", { silent = true })
vim.keymap.set('v', '<C-j>', ":m '>+1<cr>gv=gv", { silent = true })

-- split and rotate
vim.keymap.set({ 'n' }, '<leader>sj', '<cmd>split<cr>')
vim.keymap.set({ 'n' }, '<leader>sl', '<cmd>vsplit<cr>')

vim.keymap.set({ 'n' }, '<C-Left>', '<C-w>b<C-w>K')
vim.keymap.set({ 'n' }, '<C-Right>', '<C-w>b<C-w>H')

vim.keymap.set({ 'n' }, '<C-j>', '<C-w>j')
vim.keymap.set({ 'n' }, '<C-k>', '<C-w>k')
vim.keymap.set({ 'n' }, '<C-h>', '<C-w>h')
vim.keymap.set({ 'n' }, '<C-l>', '<C-w>l')

vim.keymap.set({ 'n' }, '<Left>', '<C-w>>')
vim.keymap.set({ 'n' }, '<Right>', '<C-w><')
vim.keymap.set({ 'n' }, '<Up>', '<C-w>-')
vim.keymap.set({ 'n' }, '<Down>', '<C-w>+')

-- close other window and buffer numToStr/BufOnly.nvim
vim.keymap.set('n', '<leader>nc', '<cmd>q<cr>', { desc = 'Close Current Window' })
vim.keymap.set('n', '<leader>no', '<cmd>only<cr>', { desc = 'Close Other Windows' })
vim.keymap.set('n', '<leader>nC', '<cmd>bd<cr>', { desc = 'Delete Current Buffer' })
vim.keymap.set('n', '<leader>nO', '<cmd>lua require("custom.functions").BufOnly("", "")<cr>', { desc = 'Delete Other Buffers' })
