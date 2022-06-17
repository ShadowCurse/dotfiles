local utils = require "core.utils"

-- plug init
vim.cmd("source ~/.config/nvim/custom.vim")

-- utils.disabled_builtins()
-- utils.bootstrap()

local sources = {
  "core.options",
  "core.plugins",
  "core.mappings",
}

for _, source in ipairs(sources) do
  local status_ok, fault = pcall(require, source)
  if not status_ok then
    error("Failed to load " .. source .. "\n\n" .. fault)
  end
end

-- keep this last:
utils.compiled()
