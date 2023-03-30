return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "nvim-lsp-installer",
  },
  -- module = "lspconfig",

  config = function()
    local lspconfig = require("lspconfig")

    ------------------
    ---- LSP UI ------
    ------------------

    local function lspSymbol(name, icon)
      local hl = "DiagnosticSign" .. name
      vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
    end

    lspSymbol("Error", "")
    lspSymbol("Info", "")
    lspSymbol("Hint", "")
    lspSymbol("Warn", "")

    vim.diagnostic.config {
      virtual_text = {
        prefix = "",
      },
      signs = true,
      underline = true,
      update_in_insert = false,
    }

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "single",
    })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "single",
    })

    -- suppress error messages from lang servers
    vim.notify = function(msg, log_level)
      if msg:match "exit code" then
        return
      end
      if log_level == vim.log.levels.ERROR then
        vim.api.nvim_err_writeln(msg)
      else
        vim.api.nvim_echo({ { msg } }, true, {})
      end
    end

    -- Borders for LspInfo winodw
    local win = require "lspconfig.ui.windows"
    local _default_opts = win.default_opts

    win.default_opts = function(options)
      local opts = _default_opts(options)
      opts.border = "single"
      return opts
    end

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "single",
      silent = true,
      focusable = false,
      close_events = { "InsertCharPre", "CursorMoved" },
      anchor = "SW",
      relative = "cursor",
      row = -1,
    })

    ------------------
    --- LSP CONFIG ---
    ------------------

    local on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = true
      client.server_capabilities.documentRangeFormattingProvider = true

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

    lspconfig.lua_ls.setup {
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

    local servers = { "zls", "rnix", "clangd", "ccls" }
    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end
  end
}
