local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local keymaps = require('user.lsp.keymaps')

local servers = {
  'html',  
  'cssls',  
  'solargraph',  
  'tsserver',  
  'volar',  
  'dartls',  
  'tailwindcss',  
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = keymaps,
    capabilities = capabilities,
  }
end

