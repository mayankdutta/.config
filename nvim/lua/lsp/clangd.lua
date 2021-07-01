require'lspconfig'.clangd.setup {
  cmd = {"/usr/local/opt/llvm/bin/clangd"},
  on_attach = require'lsp'.common_on_attach,
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = O.lang.clang.diagnostics.virtual_text,
      signs = O.lang.clang.diagnostics.signs,
      underline = O.lang.clang.diagnostics.underline,
      update_in_insert = true

    })
  },
  commands = {
    Format = {
      function()
        vim.lsp.buf.formatting()
      end
    }
  }
}
