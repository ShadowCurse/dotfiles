local present, nvimtree = pcall(require, "nvim-tree")

if not present then
  return
end

local options = {
   -- filters = {
   --    dotfiles = false,
   --    exclude = { "custom" },
   -- },
   -- disable_netrw = true,
   -- hijack_netrw = true,
   -- ignore_ft_on_setup = { "alpha" },
   -- open_on_tab = false,
   -- hijack_cursor = true,
   -- hijack_unnamed_buffer_when_opening = false,
   -- update_cwd = true,
   -- update_focused_file = {
   --    enable = true,
   --    update_cwd = false,
   -- },
   -- view = {
   --    side = "left",
   --    width = 25,
   --    hide_root_folder = true,
   -- },
   -- git = {
   --    enable = true,
   --    ignore = false,
   -- },
   -- actions = {
   --    open_file = {
   --       resize_window = false,
   --    },
   -- },
   -- renderer = {
   --    highlight_git = true,
   --    highlight_opened_files = "none",
   --
   --    indent_markers = {
   --       enable = false,
   --    },
   -- },
}

nvimtree.setup(options)
