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
-- need to do this before loading lazy
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("mappings").set_default_bindings()
require("colors").setup()
require("lazy").setup("plugins")

-- use filetype.lua instead of filetype.vim
vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 1

vim.filetype.add({
  extension = {
    wgsl = "wgsl",
    odin = "odin",
    roc = "roc",
  }
})

vim.opt.clipboard = "unnamedplus"
vim.opt.cul = true -- cursor line

vim.opt.colorcolumn = "100"

-- Indentline
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = "a"

-- Numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2

-- disable nvim intro
vim.opt.shortmess:append "sI"

vim.opt.tabstop = 8
vim.opt.timeoutlen = 400
vim.opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
vim.opt.updatetime = 250
