local global = vim.g

vim.keymap.set('n', '<C-n>', '<cmd>nohlsearch<cr>')

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
vim.keymap.set('n', '<leader>bc', '<cmd>q<cr>', { desc = 'Close Current Window' })
vim.keymap.set('n', '<leader>bo', '<cmd>only<cr>', { desc = 'Close Other Windows' })
vim.keymap.set('n', '<leader>bC', '<cmd>bd<cr>', { desc = 'Delete Current Buffer' })
vim.keymap.set('n', '<leader>bO', '<cmd>lua require("custom.functions").BufOnly("", "")<cr>', { desc = 'Delete Other Buffers' })
