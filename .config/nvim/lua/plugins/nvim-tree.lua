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
      view = {
        float = {
          enable = true,
          open_win_config = function()
            local width_p = 0.8
            local height_p = 0.8
            local screen_w = vim.opt.columns:get()
            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
            local col = (screen_w * (1.0 - width_p)) / 2.0
            local row = (screen_h * (1.0 - height_p)) / 2.0
            local width = screen_w * width_p
            local height = screen_h * height_p
            return {
              border = "rounded",
              relative = "editor",
              col = math.floor(col),
              row = math.floor(row),
              width = math.floor(width),
              height = math.floor(height),
            }
          end,
        },
        width = function()
          return math.floor(vim.opt.columns:get() * 5)
        end,
      },
    }

    nvimtree.setup(options)
  end
}
