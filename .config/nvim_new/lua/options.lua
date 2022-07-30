local opt = vim.opt
local g = vim.g

-- colorscheme
vim.cmd[[colorscheme tokyodark]]

-- set leader
g.mapleader = " "

-- use filetype.lua instead of filetype.vim
g.did_load_filetypes = 0
g.do_filetype_lua = 1

opt.clipboard = "unnamedplus"
opt.cul = true -- cursor line

-- Indentline
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true

-- disable tilde on end of buffer: https://github.com/neovim/neovim/pull/8546#issuecomment-643643758
-- opt.fillchars = { eob = " " }

opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
-- opt.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

-- opt.signcolumn = "yes"
-- opt.splitbelow = true
-- opt.splitright = true
opt.tabstop = 8
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- disable some builtin vim plugins
local default_plugins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
   "python3_provider",
   "python_provider",
   "node_provider",
   "ruby_provider",
   "perl_provider",
   "tutor",
   "rplugin",
   "syntax",
   "synmenu",
   "optwin",
   "compiler",
   "bugreport",
   "ftplugin",
}

for _, plugin in pairs(default_plugins) do
   g["loaded_" .. plugin] = 1
end

-- set shada path
vim.schedule(function()
   vim.opt.shadafile = vim.fn.expand "$HOME" .. "/.local/share/nvim/shada/main.shada"
   vim.cmd [[ silent! rsh ]]
end)

-- load user options if the file exists
-- config.options.user()