-- Use a protected call for packer, to prevent runtime error
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'  -- The packer itself for auto-update

  -- Plugin required dependencies
  use 'nvim-lua/plenary.nvim'

  -- Colorscheme
  use 'morhetz/gruvbox'         -- Gruvbox color scheme

  -- cmp plugins
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets plugin
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/null-ls.nvim'

  -- Treesitter
   use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
   }

  -- Telescope
  use 'nvim-telescope/telescope.nvim'

  -- coloured icons
  use 'kyazdani42/nvim-web-devicons'

  -- Nerd Tree 
  use 'kyazdani42/nvim-tree.lua'

  -- BufferLine
  use 'akinsho/bufferline.nvim'

  -- Git integrations
  use 'lewis6991/gitsigns.nvim'

  -- Status line
  use 'nvim-lualine/lualine.nvim'

  -- Testing utils
  use 'vim-test/vim-test'
end)
