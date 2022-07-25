vim.cmd [[packadd packer.nvim]]

local plugins = {

   ["nvim-lua/plenary.nvim"] = {},
   ["wbthomason/packer.nvim"] = {},

   ["kyazdani42/nvim-web-devicons"] = {
      module = "nvim-web-devicons",
   },

   ["akinsho/bufferline.nvim"] = {
      tag = "v2.*",
   },

   ["lukas-reineke/indent-blankline.nvim"] = {
   },

   ["nvim-treesitter/nvim-treesitter"] = {
      module = "nvim-treesitter",
      cmd = { "TSInstall", "TSUninstall" },
      run = ":TSUpdate",
   },

   -- git stuff
   ["lewis6991/gitsigns.nvim"] = {
   },

   -- lsp stuff

   ["williamboman/nvim-lsp-installer"] = {
   },

   ["neovim/nvim-lspconfig"] = {
      after = "nvim-lsp-installer",
      module = "lspconfig",
   },

   -- load luasnips + cmp related in insert mode only

   ["rafamadriz/friendly-snippets"] = {
      module = "cmp_nvim_lsp",
      event = "InsertEnter",
   },

   ["hrsh7th/nvim-cmp"] = {
      after = "friendly-snippets",
   },

   ["L3MON4D3/LuaSnip"] = {
      wants = "friendly-snippets",
      after = "nvim-cmp",
   },

   ["saadparwaiz1/cmp_luasnip"] = {
      after = "LuaSnip",
   },

   ["hrsh7th/cmp-nvim-lua"] = {
      after = "cmp_luasnip",
   },

   ["hrsh7th/cmp-nvim-lsp"] = {
      after = "cmp-nvim-lua",
   },

   ["hrsh7th/cmp-buffer"] = {
      after = "cmp-nvim-lsp",
   },

   ["hrsh7th/cmp-path"] = {
      after = "cmp-buffer",
   },

   -- misc plugins
   ["windwp/nvim-autopairs"] = {
      after = "nvim-cmp",
   },

   ["numToStr/Comment.nvim"] = {
      module = "Comment",
      keys = { "gc", "gb" },
   },

   -- file managing , picker etc
   ["kyazdani42/nvim-tree.lua"] = {
      ft = "alpha",
      cmd = { "NvimTreeToggle", "NvimTreeFocus" },
   },

   ["nvim-telescope/telescope.nvim"] = {
      cmd = "Telescope",
   },

   -- Only load whichkey after all the gui
   ["folke/which-key.nvim"] = {
      module = "which-key",
   },
}

require("packer_wrapper").init(plugins)
