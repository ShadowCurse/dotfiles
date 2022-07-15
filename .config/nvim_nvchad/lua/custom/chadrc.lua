-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "tokyodark",
   guifont = "Monaco:h10",
}

M.plugins = {
   options = {
      lspconfig = {
         setup_lspconf = "custom.lspconf",
      },
   },
}

return M
