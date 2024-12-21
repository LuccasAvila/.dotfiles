local servers = { 'cssls', 'tailwindcss', 'eslint', 'lua_ls',
  'rust_analyzer', 'intelephense', 'astro', 'ruby_lsp', 'volar' }

return {
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      { "folke/neodev.nvim",  opts = { experimental = { pathStrict = true } } },
      { "folke/neoconf.nvim", cmd = "Neoconf",                                config = false, dependencies = { "nvim-lspconfig" } },
      "mason.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
      inlay_hints = { enabled = true },
      diagnosticts = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      },
    },
    config = function()
      require("neoconf").setup({})

      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
      local on_attach = require("plugins.lsp.keymaps").on_attach

      for _, server in ipairs(servers) do
        require('lspconfig')[server].setup { on_attach = on_attach, capabilities = capabilities }
      end

      -- require('lspconfig').html.setup { filetypes = { "html", "heex", "erb" }, on_attach = on_attach, capabilities = capabilities }
      -- require('lspconfig').solargraph.setup { cmd = { os.getenv("HOME") .. '/.local/share/mise/shims/solargraph', 'stdio' }, on_attach = on_attach, capabilities = capabilities }

      local elixir_path = require('mason-registry').get_package('elixir-ls'):get_install_path()
      local elixir_ls = elixir_path .. '/language_server.sh'
      require('lspconfig').elixirls.setup { cmd = { elixir_ls }, on_attach = on_attach, capabilities = capabilities }

      require('lspconfig').tailwindcss.setup {
        init_options = {
          userLanguages = {
            elixir = 'html-eex',
            eelixir = 'html-eex',
            heex = 'html-eex',
          },
        },
      }

      require('lspconfig').ts_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = "/home/luccas/.local/share/pnpm/global/5/node_modules/@vue/typescript-plugin",
              languages = { "javascript", "typescript", "vue" },
            },
          },
        },
        filetypes = {
          "javascript",
          "typescript",
          "vue",
        },
      }

      vim.diagnostic.config({ float = { border = "rounded" } })
    end,
  },

  -- formatters
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        vue = { 'prettier' },
        typescript = { 'prettier' },
      },
    },
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

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({ ensure_installed = servers, ui = { border = 'rounded' } })
    end
  }
}
