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
  use 'morhetz/gruvbox'  -- Gruvbox color scheme
  use {'catppuccin/nvim', as = 'catppuccin'}
  use 'folke/tokyonight.nvim'

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
  use 'ray-x/lsp_signature.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'rafamadriz/friendly-snippets'
  use { "folke/trouble.nvim", cmd = "TroubleToggle" }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'

  -- Git integrations
  use 'lewis6991/gitsigns.nvim'
  use 'TimUntersberger/neogit'

  -- Status line
  use 'nvim-lualine/lualine.nvim'

  -- Testing utils
  use 'vim-test/vim-test'

  -- Misc
  use 'tpope/vim-surround'
  use 'numToStr/Comment.nvim'
  use 'norcalli/nvim-colorizer.lua' -- color highlighter
  use 'folke/todo-comments.nvim'

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- Database
  use 'tpope/vim-dadbod'
  use 'kristijanhusak/vim-dadbod-ui'
end)

