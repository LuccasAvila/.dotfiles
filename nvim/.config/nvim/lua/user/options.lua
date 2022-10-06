local options = {
  number = true,
  relativenumber = true,

  mouse = "a",

  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,

  wrap = false,			

  swapfile = false,
  backup = false,
  undofile = true,			-- Enable persistent undo

  hlsearch = false,
  incsearch = true,

  scrolloff = 8,		  	-- 8 lines above and below the cursor
  updatetime = 50, 		-- Faster completion
  signcolumn = "yes",

  termguicolors = true, -- set term gui colors
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Netrw options
vim.g.netrw_banner = 0

