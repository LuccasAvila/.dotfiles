vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

local gitsigns = require('gitsigns')
gitsigns.setup({})
