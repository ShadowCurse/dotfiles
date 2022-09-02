local present, vimspector = pcall(require, "vimspector")

if not present then
  return
end

vim.g.vimspector_sidebar_width = 85
vim.g.vimspector_bottombar_height = 15
vim.g.vimspector_terminal_maxwidth = 70
vim.g.vimspector_enable_mappings = 'HUMAN'

vimspector.setup()
