local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Short hand the keymap
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Normal Mode --
-- Better navigation between windows
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

keymap('n', '<leader>e', ':NvimTreeToggle<cr>', opts)

-- Navigation between buffers
keymap('n', '<A-l>', ':bnext<CR>', opts)
keymap('n', '<A-h>', ':bprevious<CR>', opts)

-- Insert Mode --
-- Press jk to return to NORMAL mode
keymap('i', 'jk', '<ESC>', opts)

