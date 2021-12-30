local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

keymap('n', '<leader>t', ':TestNearest<CR>', opts)
keymap('n', '<leader>T', ':TestFile<CR>', opts)
keymap('n', '<leader>a', ':TestSuit<CR>', opts)
keymap('n', '<leader>l', ':TestLast<CR>', opts)
keymap('n', '<leader>g', ':TestVisit<CR>', opts)
