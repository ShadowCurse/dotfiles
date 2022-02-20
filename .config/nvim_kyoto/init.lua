local vim = vim

-- line-numbers must be declared before dashboard
-- init because otherwise dashboard shows line numbers
vim.opt.nu = true

-- Global variables
require("globals")
-- Personal global variables
pcall(require, "personal-globals")
-- general configurations
require("options")
-- Plugin configurations
require("plugins")
-- Colors
require("colors.highlights")
-- Langauge server configuration
require("lsp-config")
-- Plugin configurations
require("plugins")
-- source our mappings last(may change)
vim.cmd("source ~/.config/nvim/viml/maps.vim")
-- auto-commands
vim.cmd("source ~/.config/nvim/viml/autocmd.vim")
-- user configurations
-- require("kyotorc")

-- custom
vim.cmd("source ~/.config/nvim/custom.vim")
