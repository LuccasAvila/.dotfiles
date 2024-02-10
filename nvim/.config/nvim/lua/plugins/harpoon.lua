return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    lazy = false,
    config = function()
      local harpoon = require("harpoon")

      harpoon:setup({
        settings = {
          save_on_toggle = true,
          sync_on_ui_close = true,
        }
      })
    end,
    keys = function()
      local harpoon = require("harpoon")

      return {
        { '<leader><leader>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end },
        { '<leader>a',        function() harpoon:list():append() end },
      }
    end,
  }
}
