local nvim_lsp = require 'lspconfig'

nvim_lsp.ts_ls.setup {
  on_attach = function(client, bufnr)
    -- disable formatting if you use prettier or null-ls for formatting
    client.server_capabilities.documentFormattingProvider = false
  end,
  filetypes = {
    'typescript',
    'typescriptreact',
    'typescript.tsx',
    'javascript',
    'javascriptreact',
    'javascript.jsx',
  },
  cmd = { 'typescript-language-server', '--stdio' },
}
