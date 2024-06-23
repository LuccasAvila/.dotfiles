return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    enabled = false,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      styles = {
        keywords = { "bold" },
        functions = { "italic" },
      },
      integrations = {
        harpoon = true,
        mason = true,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  {
    "ellisonleao/gruvbox.nvim", priority = 1000,
    config = function(_, opts)
      require("gruvbox").setup(opts)
      vim.cmd("colorscheme gruvbox")
    end,
    opts = { transparent_mode = true }
  },
}
