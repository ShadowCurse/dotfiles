return {
  "nvim-treesitter/nvim-treesitter",

  cmd = { "TSInstall", "TSUninstall" },
  build = ":TSUpdate",

  config = function()
    local treesitter = require("nvim-treesitter.configs")

    local options = {
      highlight = {
        enable = true,
        use_languagetree = true,
        disable = { "c", "query", "lua", "vim", "vimdoc" },
      },
    }

    treesitter.setup(options)
  end
}
