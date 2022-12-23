vim.cmd [[packadd packer.nvim]]

local plugins = {

  ["wbthomason/packer.nvim"] = {},

  -- visual
  ["tiagovla/tokyodark.nvim"] = {},
  ["kyazdani42/nvim-web-devicons"] = {
    module = "nvim-web-devicons",
  },
  ["nvim-lualine/lualine.nvim"] = {},
  ["lukas-reineke/indent-blankline.nvim"] = {},
  ["nvim-treesitter/nvim-treesitter"] = {
    module = "nvim-treesitter",
    cmd = { "TSInstall", "TSUninstall" },
    run = ":TSUpdate",
  },
  ["rrethy/vim-illuminate"] = {},
  ["ap/vim-css-color"] = {},

  -- lua additions for other plugins
  ["nvim-lua/plenary.nvim"] = {},

  -- fixes filetypes
  ["nathom/filetype.nvim"] = {},

  -- list of diagnostics, references, telescope results...
  ["folke/trouble.nvim"] = {
    requires = "kyazdani42/nvim-web-devicons",
  },

  -- debugging
  -- ["puremourning/vimspector"] = {},

  -- file managing , picker etc
  ["kyazdani42/nvim-tree.lua"] = {},
  ["nvim-telescope/telescope.nvim"] = {
    cmd = "Telescope",
  },

  -- misc plugins
  ["windwp/nvim-autopairs"] = {
    after = "nvim-cmp",
  },

  ["numToStr/Comment.nvim"] = {
    module = "Comment",
    keys = { "gc", "gb" },
  },

  -- git stuff
  ["tpope/vim-fugitive"] = {},
  ["lewis6991/gitsigns.nvim"] = {},

  -- lsp stuff
  ["williamboman/nvim-lsp-installer"] = {},

  ["neovim/nvim-lspconfig"] = {
    after = "nvim-lsp-installer",
    module = "lspconfig",
  },

  -- load luasnips + cmp related in insert mode only
  -- lsp compleation
  ["hrsh7th/nvim-cmp"] = {},

  ["L3MON4D3/LuaSnip"] = {
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
}

require("packer_wrapper").init(plugins)
