local M = {}

local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

-- -- Remap space as leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Navigate buffers
-- map("n", "<S-l>", "<cmd>bnext<CR>", opts)
-- map("n", "<S-h>", "<cmd>bprevious<CR>", opts)
-- map("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", opts)
-- map("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", opts)
-- map("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", opts)
-- map("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", opts)
-- map("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", opts)
-- map("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>", opts)
-- map("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>", opts)
-- map("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>", opts)
-- map("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<CR>", opts)
-- map("n", "<leader>bd", "<cmd>Bdelete<CR>", opts)
map("n", "<leader>1", "<cmd>BufferGoto 1<CR>", opts)
map("n", "<leader>2", "<cmd>BufferGoto 2<CR>", opts)
map("n", "<leader>3", "<cmd>BufferGoto 3<CR>", opts)
map("n", "<leader>4", "<cmd>BufferGoto 4<CR>", opts)
map("n", "<leader>5", "<cmd>BufferGoto 5<CR>", opts)
map("n", "<leader>6", "<cmd>BufferGoto 6<CR>", opts)
map("n", "<leader>7", "<cmd>BufferGoto 7<CR>", opts)
map("n", "<leader>8", "<cmd>BufferGoto 8<CR>", opts)
map("n", "<leader>9", "<cmd>BufferGoto 9<CR>", opts)
map("n", "<leader>bd", "<cmd>BufferClose<CR>", opts)

-- NvimTree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", opts)

-- Telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", opts)
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", opts)
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", opts)

-- Lspsaga
map("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
map("n", "ca", "<cmd>Lspsaga code_action<CR>", opts)
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
map("n", "rn", "<cmd>Lspsaga rename<CR>", opts)
map("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
map("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
-- map("n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", opts)
-- map("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", opts)
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

-- Comment
map("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
map("v", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", opts)

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

return M
