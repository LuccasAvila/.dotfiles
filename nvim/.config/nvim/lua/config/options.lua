vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.showmode = false
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.background = 'dark'

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@')

vim.opt.updatetime = 50

vim.g.netrw_banner = 0

-- Better completion experience
vim.o.completeopt = 'menuone,noselect'
