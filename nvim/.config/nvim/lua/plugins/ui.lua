return {
  -- Icons
  {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
  },
  -- Lualine
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = {
      options = {
        theme = 'auto',
        globalstatus = true,
      },
    },
  },

  -- UI components
  { 'MunifTanjim/nui.nvim', lazy = true },
}
