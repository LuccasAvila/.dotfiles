local servers = { 'html', 'cssls', 'tsserver', 'volar', 'tailwindcss', 'gopls', 'eslint', 'lua_ls',
  'rust_analyzer', 'intelephense', 'ocamllsp' }

return {
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
      diagnosticts = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      },
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
      local on_attach = require("plugins.lsp.keymaps").on_attach

      for _, server in ipairs(servers) do
        require('lspconfig')[server].setup { on_attach = on_attach, capabilities = capabilities }
      end

      require('lspconfig').solargraph.setup { cmd = { os.getenv("HOME") .. '/.asdf/shims/solargraph', 'stdio' }, on_attach = on_attach, capabilities = capabilities }

      require('lspconfig').elixirls.setup { cmd = { os.getenv("HOME") .. '/.development/elixir-ls/language_server.sh' }, on_attach = on_attach, capabilities = capabilities }

      require("mason-lspconfig").setup({ ensure_installed = servers, ui = { border = 'rounded' } })

      -- Override borders to rounded
      local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = 'rounded'
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
      end
    end,
  },

  -- formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.stylua,
          nls.builtins.diagnostics.flake8,
        }
      }
    end,
  },

  -- tools for lsp
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      ensure_installed = servers,
    },
    config = function(_, opts)
      require("mason").setup(opts)
    end,
  },
}
