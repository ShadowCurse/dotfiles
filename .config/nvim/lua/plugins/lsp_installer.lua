return {
  "williamboman/nvim-lsp-installer",

  config = function()
    local lsp_installer = require("nvim-lsp-installer")

    local options = {
      automatic_installation = false,

      ui = {
        icons = {
          server_installed = " ",
          server_pending = " ",
          server_uninstalled = " ﮊ",
        },
        keymaps = {
          toggle_server_expand = "<CR>",
          install_server = "i",
          update_server = "u",
          check_server_version = "c",
          update_all_servers = "U",
          check_outdated_servers = "C",
          uninstall_server = "X",
        },
      },

      max_concurrent_installers = 20,
    }

    lsp_installer.setup(options)
  end
}
