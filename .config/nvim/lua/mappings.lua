local default_bindings = {}

default_bindings.general = {
  -- i = {
  --   -- go to  beginning and end
  --   ["<C-b>"] = { "<ESC>^i", "beginning of line" },
  --   ["<C-e>"] = { "<End>", "end of line" },
  --
  --   -- navigate within insert mode
  --   ["<C-h>"] = { "<Left>", "move left" },
  --   ["<C-l>"] = { "<Right>", "move right" },
  --   ["<C-j>"] = { "<Down>", "move down" },
  --   ["<C-k>"] = { "<Up>", "move up" },
  -- },

  n = {
    ["<ESC>"] = { "<cmd> noh <CR>", "no highlight" },

    -- switch between windows
    ["<C-h>"] = { "<C-w>h", "window left" },
    ["<C-l>"] = { "<C-w>l", "window right" },
    ["<C-j>"] = { "<C-w>j", "window down" },
    ["<C-k>"] = { "<C-w>k", "window up" },
  },

  v = {
    ["<"] = { "<gv", "move selected to the left" },
    [">"] = { ">gv", "move selected to the right" },
  },
}

default_bindings.terminal = {
  t = {
    ["<Esc>"] = { "<C-\\><C-n>", "exit terminal" },
  },
}

default_bindings.bufferline = {
  n = {
    -- new buffer
    ["<S-b>"] = { "<cmd> enew <CR>", "new buffer" },

    -- close buffer
    ["<leader>bd"] = {
      function()
        vim.cmd(":bp | bd" .. vim.fn.bufnr())
      end,
      "close buffer",
    },

    ["<leader>bca"] = { "<cmd>bufdo bd<CR>", "close all buffers" },
  },
}

default_bindings.comment = {
  -- toggle comment in both modes
  n = {
    ["<leader>/"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,

      "toggle comment",
    },
  },

  v = {
    ["<leader>/"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  },
}

default_bindings.nvimtree = {
  n = {
    -- toggle
    ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },
  },
}

default_bindings.telescope = {
  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "  find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "  find all" },
    ["<leader>w"] = { "<cmd> Telescope live_grep <CR>", "   live grep" },
    ["<leader>s"] = { "<cmd> Telescope buffers <CR>", "  find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "  help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "   find oldfiles" },
    ["<leader>tk"] = { "<cmd> Telescope keymaps <CR>", "   show keys" },

    -- git
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "   git commits" },
    ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "  git status" },
  },
}

local lsp_bindings = {
  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions
  n = {
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "   lsp declaration",
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "   lsp definition",
    },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "   lsp implementation",
    },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "   lsp hover",
    },

    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "   lsp code_action",
    },

    ["<leader>df"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "   floating diagnostic",
    },

    ["<leader>rn"] = {
      function()
        vim.lsp.buf.rename()
      end,
      "   rename",
    },

    ["<leader>dp"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "   goto prev",
    },

    ["<leader>dn"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "   goto_next",
    },

    ["<leader>q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "   diagnostic setloclist",
    },

    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format({ async = true })
      end,
      "   lsp formatting",
    },

    -- ["gr"] = {
    --   function()
    --     vim.lsp.buf.references()
    --   end,
    --   "   lsp references",
    -- },

    ["gr"] = {
      "<cmd> Trouble lsp_references toggle focus=true<CR>",
      "   lsp references",
    },

    ["<C-j>"] = { "<cmd> Trouble <CR>", "toggle Trouble workspace_diagnostics" },
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
