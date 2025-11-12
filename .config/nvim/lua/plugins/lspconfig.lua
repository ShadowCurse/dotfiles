return {
  "neovim/nvim-lspconfig",
  config = function()
    local on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = true
      client.server_capabilities.documentRangeFormattingProvider = true

      require("mappings").set_lsp_bindings(bufnr)
    end
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local servers = {
      "lua_ls",
      "rust_analyzer",
      "zls",
      "ols",
      "rnix",
      "clangd",
      "pylsp",
      "pyrefly",
      "gopls",
    }
    for _, lsp in ipairs(servers) do
      vim.lsp.config(lsp, {
        on_attach = on_attach,
      --   capabilities = capabilities,
      })
      vim.lsp.enable(lsp)
    end
  end
}
