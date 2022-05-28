local utils = require "core.utils"

-- plug init
vim.cmd("source ~/.config/nvim/custom.vim")

utils.disabled_builtins()

utils.bootstrap()

utils.impatient()

local sources = {
  "core.options",
  "core.autocmds",
  "core.plugins",
  "core.mappings",
}

for _, source in ipairs(sources) do
  local status_ok, fault = pcall(require, source)
  if not status_ok then
    error("Failed to load " .. source .. "\n\n" .. fault)
  end
end

local settings = utils.settings()

if type(settings.polish) == "function" then
  settings.polish()
else
  error "The polish value in your user configuration must be a function"
end

-- keep this last:
utils.compiled()
