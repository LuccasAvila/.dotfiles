return {
  -- Icons
  {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
  },

  -- Lualine
  { 'AndreM222/copilot-lualine' },
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = {
      options = {
        theme = 'auto',
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
      },

      sections = {
        lualine_a = {
          { "mode", separator = { left = "", right = "" } },
        },
        lualine_b = {
          { "branch", icon = "", separator = { left = "", right = "" } },
          { "diff", separator = { left = "", right = "" } },
        },
        lualine_c = {
          { "diagnostics", separator = { left = "", right = "" } },
          { "filename", path = 1, },
        },
        lualine_x = { "filesize", "copilot" },
        lualine_y = { { "filetype", icons_enabled = false } },
        lualine_z = { { "location" } },
      },
    },
  },

  -- UI components
  { 'MunifTanjim/nui.nvim',     lazy = true },
}
