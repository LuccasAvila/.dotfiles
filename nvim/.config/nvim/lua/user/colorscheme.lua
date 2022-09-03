local ok, catppuccin = pcall(require, "catppuccin")
if not ok then return end

catppuccin.setup {}
vim.g.catppuccin_flavour = "mocha"
vim.cmd[[colorscheme catppuccin]]
