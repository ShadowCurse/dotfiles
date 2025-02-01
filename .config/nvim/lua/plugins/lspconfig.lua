return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")

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
      "ccls",
      "pylsp",
      "gopls",
    }
    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end
  end
}
