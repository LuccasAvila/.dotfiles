vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use('wbthomason/packer.nvim') -- The Packer itself for auto-update

  -- Colorshemes
  use('folke/tokyonight.nvim')

  -- Project navigation
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- LSP
  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
  }
  use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}
  use {'jose-elias-alvarez/null-ls.nvim', requires = 'nvim-lua/plenary.nvim'}

  -- Autocompletion
  use {
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }

  -- Treesitter
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
  use('nvim-treesitter/nvim-treesitter-textobjects', { after = 'nvim-treesitter' })
  use('nvim-treesitter/nvim-treesitter-context')
  use('JoosepAlviste/nvim-ts-context-commentstring')
  use('nvim-treesitter/playground')

  -- Diagnotics
  use('folke/trouble.nvim', { cmd = "TroubleToggle" })

  -- Git related
  use('tpope/vim-fugitive')
  use('lewis6991/gitsigns.nvim')

  -- Status line
  use('nvim-lualine/lualine.nvim')

  -- Testing utils
  use('vim-test/vim-test')

  -- Misc
  use('numToStr/Comment.nvim')
  use('slim-template/vim-slim')
end)
