local options = {
  mouse = "a",
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  number = true,
  undofile = true,			-- Enable persistent undo
  updatetime = 300, 		-- Faster completion
  wrap = false,			
  scrolloff = 8,		  	-- 8 lines above and below the cursor
  termguicolors = true, -- set term gui colors
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
