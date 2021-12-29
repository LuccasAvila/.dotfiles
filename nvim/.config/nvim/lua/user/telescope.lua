local telescope = require 'telescope'

local opts = { noremap = true, silent = true, }
local keymap = vim.api.nvim_set_keymap

local map_builtin = function(key, fn) 
  local cmd = string.format('<cmd>lua require("telescope.builtin")["%s"]()<CR>', fn)
  keymap('n', key, cmd, opts)
end

map_builtin('<leader>ff', 'find_files')
map_builtin('<leader>fg', 'live_grep')
map_builtin('<leader>fb', 'buffers')
map_builtin('<leader>fh', 'help_tags')

