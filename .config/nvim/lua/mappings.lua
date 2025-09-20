local default_bindings = {}

default_bindings.general = {
  n = {
    ["<ESC>"] = { "<cmd> noh <CR>" },

    -- switch between windows
    ["<C-h>"] = { "<C-w>h" },
    ["<C-l>"] = { "<C-w>l" },
    ["<C-j>"] = { "<C-w>j" },
    ["<C-k>"] = { "<C-w>k" },
  },

  v = {
    ["<"] = { "<gv" },
    [">"] = { ">gv" },
  },

  x = {
    -- make paste not replace copy buffer value with owerwritten value
    ["p"] = { "pgvy" },
  },
}

default_bindings.terminal = {
  t = {
    ["<Esc>"] = { "<C-\\><C-n>" },
  },
}

default_bindings.bufferline = {
  n = {
    ["<leader>bd"] = {
      function()
        vim.cmd(":bp | bd" .. vim.fn.bufnr())
      end,
      "close buffer",
    },

    ["<leader>bca"] = { "<cmd>bufdo bd<CR>" },
  },
}

default_bindings.nvimtree = {
  n = {
    -- toggle
    ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>" },
  },
}

default_bindings.telescope = {
  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>" },
    ["<leader>w"] = { "<cmd> Telescope live_grep <CR>" },
    ["<leader>s"] = { "<cmd> Telescope buffers <CR>" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>" },
    ["<leader>tk"] = { "<cmd> Telescope keymaps <CR>" },

    -- git
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>" },
    ["<leader>gs"] = { "<cmd> Telescope git_status <CR>" },
  },
}

local lsp_bindings = {
  n = {
    -- K => vim.lsp.buf.hover()
    -- grt => vim.lsp.buf.type_definition()
    -- gra => vim.lsp.buf.code_action()
    -- gri => vim.lsp.buf.implementation()
    -- grn => vim.lsp.buf.rename()
    -- grr => vim.lsp.buf.reference()
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format({ async = true })
      end,
    },
  },
}

local set_bindings = function(mapping_table, buffer)
  -- skip mapping this as its mapppings are loaded in lspconfig
  for mode, mode_mappings in pairs(mapping_table) do
    for keybind, mapping_info in pairs(mode_mappings) do
      if mapping_info.opts then
        mapping_info.opts = nil
      end
      -- map_func(mode, keybind, mapping_info)
      vim.keymap.set(mode, keybind, mapping_info[1], buffer)
    end
  end
end

local Mappings = {}

Mappings.default_bindings = default_bindings;

Mappings.lsp_bindings = lsp_bindings;

Mappings.set_default_bindings = function()
  for _, section_mappings in pairs(Mappings.default_bindings) do
    set_bindings(section_mappings)
  end
end

Mappings.set_lsp_bindings = function(buffer)
  set_bindings(Mappings.lsp_bindings, { buffer = buffer })
end

return Mappings
