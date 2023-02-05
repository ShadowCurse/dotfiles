return {
  "kyazdani42/nvim-tree.lua",

  config = function()
    local nvimtree = require("nvim-tree")

    local options = {
      disable_netrw = true,
      hijack_netrw = true,
      hijack_cursor = true,
      hijack_unnamed_buffer_when_opening = false,
      update_cwd = true,
      update_focused_file = {
        enable = true,
        -- update_cwd = false,
      },
      git = {
        enable = true,
        ignore = false,
      },
      renderer = {
        highlight_git = true,
        highlight_opened_files = "none",
      },
    }

    nvimtree.setup(options)
  end
}
