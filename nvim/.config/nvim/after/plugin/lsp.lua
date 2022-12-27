local lsp = require('lspconfig')
local mason = require('mason')
local mason_lsp = require('mason')

local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = '[LSP] ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('gr', vim.lsp.buf.references, '[G]oto [R]references')
  nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplemetation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')

  nmap('<leader>f', vim.lsp.buf.format, '[F]ormat file')

  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Diagostics
  nmap('[d', vim.diagnostic.goto_prev, 'Goto previous diagnostic')
  nmap(']d', vim.diagnostic.goto_next, 'Goto next diagnostic')
  nmap('gl', vim.diagnostic.open_float, 'Open diagnostic float')
  nmap('<leader>q', vim.diagnostic.setloclist, 'Quickfix')
end

local servers = { 'html', 'cssls', 'solargraph', 'tsserver', 'volar', 'tailwindcss', 'gopls', 'eslint', 'sumneko_lua', 'rust_analyzer', 'dartls' }

mason.setup({ ui = { border = 'rounded' } })

mason_lsp.setup({
  ensure_installed = servers
})

vim.diagnostic.config({
  virtual_text = true,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

for _, server in ipairs(servers) do
  lsp[server].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lsp.sumneko_lua.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
    },
  },
}
