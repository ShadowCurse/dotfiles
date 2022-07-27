local present, lsp_installer = pcall(require, "nvim-lsp-installer")

if not present then
   return
end

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
