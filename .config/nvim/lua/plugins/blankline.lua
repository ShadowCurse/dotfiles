return {
  "lukas-reineke/indent-blankline.nvim",

  config = function()
    local blankline = require("indent_blankline")

    local options = {
      indentLine_enabled = 1,
      char = "▏",
      filetype_exclude = {
        "help",
        "terminal",
        "alpha",
        "packer",
        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
        "lsp-installer",
        "",
      },
      buftype_exclude = { "terminal" },
      show_trailing_blankline_indent = false,
      show_first_indent_level = false,
    }

    blankline.setup(options)
  end
}
