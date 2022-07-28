local present, lspconfig = pcall(require, "lspconfig")

if not present then
   return
end

local on_attach = function(client, bufnr)
   print "attaching"
   client.server_capabilities.documentFormattingProvider = false
   client.server_capabilities.documentRangeFormattingProvider = false

   require("mappings").set_lsp_bindings(bufnr)

   if client.supports_method "textDocument/signatureHelp" then
      vim.api.nvim_create_autocmd({ "CursorHoldI" }, {
         pattern = "*",
         group = vim.api.nvim_create_augroup("LspSignature", {}),
         callback = function()
            vim.lsp.buf.signature_help()
         end,
      })
   end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
   documentationFormat = { "markdown", "plaintext" },
   snippetSupport = true,
   preselectSupport = true,
   insertReplaceSupport = true,
   labelDetailsSupport = true,
   deprecatedSupport = true,
   commitCharactersSupport = true,
   tagSupport = { valueSet = { 1 } },
   resolveSupport = {
      properties = {
         "documentation",
         "detail",
         "additionalTextEdits",
      },
   },
}

lspconfig.sumneko_lua.setup {
   on_attach = on_attach,
   capabilities = capabilities,

   settings = {
      Lua = {
         diagnostics = {
            globals = { "vim" },
         },
         workspace = {
            library = {
               [vim.fn.expand "$VIMRUNTIME/lua"] = true,
               [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
         },
      },
   },
}

lspconfig.rust_analyzer.setup {
   on_attach = on_attach,
   capabilities = capabilities,

    settings = {
      ["rust-analyzer"] = {
        cargo = {
          loadOutDirsFromCheck = true,
        },
        checkOnSave = {
          command = "clippy",
        },
        experimental = {
          procAttrMacros = true,
        },
      },
   },
}
