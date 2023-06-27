return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    opts = {
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        vim.keymap.set('n', '<leader>gb', function() gs.blame_line({ full = true }) end, { buffer = buffer, desc = 'Blame Line' })
      end,
    }
  },
  {
    'sindrets/diffview.nvim',
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = true,
    keys = { { '<leader>gd', "<cmd>DiffviewOpen<cr>", desc = "DiffView" } },
  },
}
