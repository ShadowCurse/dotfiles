return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
  config = function()
    vim.opt.list = true
    vim.opt.listchars:append('trail:~')
    require("ibl").setup {
      indent = { highlight = { "Blankline" } },
      whitespace = {
        highlight = { "Whitespace" },
        remove_blankline_trail = false,
      },
    }
  end
}
