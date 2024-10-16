return {
  "rrethy/vim-illuminate",
  "nvim-lua/plenary.nvim",
  "tpope/vim-fugitive",
  "numToStr/Comment.nvim",
  {
    "L3MON4D3/LuaSnip",
    dependencies = "nvim-cmp",
  },

  {
    "saadparwaiz1/cmp_luasnip",
    dependencies = "LuaSnip",
  },

  {
    "hrsh7th/cmp-nvim-lua",
    dependencies = "cmp_luasnip",
  },

  {
    "hrsh7th/cmp-nvim-lsp",
    dependencies = "cmp-nvim-lua",
  },

  {
    "hrsh7th/cmp-buffer",
    dependencies = "cmp-nvim-lsp",
  },

  {
    "hrsh7th/cmp-path",
    dependencies = "cmp-buffer",
  },
}
