local cmp = require 'cmp'
local luasnip = require 'luasnip'

require('luasnip/loaders/from_vscode').lazy_load()
luasnip.filetype_extend("ruby", {"rails"})


require('luasnip/loaders/from_vscode').lazy_load()
luasnip.filetype_extend("ruby", {"rails"})

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = {
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), {'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), {'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c' }),
    ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior, select = true }),
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
  }),

  window = {
    documentation = cmp.config.window.bordered(),
  }
}
