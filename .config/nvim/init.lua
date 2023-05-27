-- Bootstrap Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- set leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup("plugins")

-- use filetype.lua instead of filetype.vim
vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 1

vim.opt.clipboard = "unnamedplus"
vim.opt.cul = true -- cursor line

-- Indentline
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true

-- disable tilde on end of buffer: https://github.com/neovim/neovim/pull/8546#issuecomment-643643758
-- opt.fillchars = { eob = " " }

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = "a"

-- Numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
-- opt.ruler = false

-- disable nvim intro
vim.opt.shortmess:append "sI"

-- opt.signcolumn = "yes"
-- opt.splitbelow = true
-- opt.splitright = true
vim.opt.tabstop = 8
vim.opt.termguicolors = true
vim.opt.timeoutlen = 400
vim.opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
vim.opt.updatetime = 250

require("mappings").set_default_bindings()


