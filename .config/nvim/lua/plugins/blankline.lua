return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
  config = function()
    local highlight = {
      "Blankline",
    }
    require("ibl").setup { indent = { highlight = highlight } }
  end
}
