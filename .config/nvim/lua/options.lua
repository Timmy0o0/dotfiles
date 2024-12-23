local option = vim.opt

-- Global Settings --
option.showmode = false
option.backspace = 'indent,eol,start'
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
option.completeopt = 'menu,menuone'
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
