local M = {}

local g = vim.g

function M.bootstrap()
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    }
    print "Cloning packer...\nSetup NeoVim"
    vim.cmd [[packadd packer.nvim]]
  end
end

function M.disabled_builtins()
  g.loaded_gzip = false
  g.loaded_netrwPlugin = false
  g.loaded_netrwSettngs = false
  g.loaded_netrwFileHandlers = false
  g.loaded_tar = false
  g.loaded_tarPlugin = false
  g.zipPlugin = false
  g.loaded_zipPlugin = false
  g.loaded_2html_plugin = false
  g.loaded_remote_plugins = false
end

-- function M.config()
--   return require "core.config"
-- end

function M.compiled()
  local compiled_ok, _ = pcall(require, "packer_compiled")
  if compiled_ok then
    require "packer_compiled"
  end
end
--
-- function M.list_registered_providers_names(filetype)
--   local s = require "null-ls.sources"
--   local available_sources = s.get_available(filetype)
--   local registered = {}
--   for _, source in ipairs(available_sources) do
--     for method in pairs(source.methods) do
--       registered[method] = registered[method] or {}
--       table.insert(registered[method], source.name)
--     end
--   end
--   return registered
-- end
--
-- function M.list_registered_formatters(filetype)
--   local null_ls_methods = require "null-ls.methods"
--   local formatter_method = null_ls_methods.internal["FORMATTING"]
--   local registered_providers = M.list_registered_providers_names(filetype)
--   return registered_providers[formatter_method] or {}
-- end
--
-- function M.list_registered_linters(filetype)
--   local null_ls_methods = require "null-ls.methods"
--   local formatter_method = null_ls_methods.internal["DIAGNOSTICS"]
--   local registered_providers = M.list_registered_providers_names(filetype)
--   return registered_providers[formatter_method] or {}
-- end

return M
