local default_bindings = {}

default_bindings.general = {

  i = {

    -- go to  beginning and end
    ["<C-b>"] = { "<ESC>^i", "beginning of line" },
    ["<C-e>"] = { "<End>", "end of line" },

    -- navigate within insert mode
    ["<C-h>"] = { "<Left>", "move left" },
    ["<C-l>"] = { "<Right>", "move right" },
    ["<C-j>"] = { "<Down>", "move down" },
    ["<C-k>"] = { "<Up>", "move up" },
  },

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

  x = {
    ["<leader>p"] = { "\"_dP", "no highlight" },
  },
}

default_bindings.bufferline = {

  n = {
    -- new buffer
    ["<S-b>"] = { "<cmd> enew <CR>", "烙 new buffer" },

    -- cycle through buffers
    ["<TAB>"] = { "<cmd> BufferLineCycleNext <CR>", "  cycle next buffer" },
    ["<S-Tab>"] = { "<cmd> BufferLineCyclePrev <CR>", "  cycle prev buffer" },

    ["<leader>1"] = { "<cmd>BufferLineGoToBuffer 1<CR>", "go to buffer 1" },
    ["<leader>2"] = { "<cmd>BufferLineGoToBuffer 2<CR>", "go to buffer 2" },
    ["<leader>3"] = { "<cmd>BufferLineGoToBuffer 3<CR>", "go to buffer 3" },
    ["<leader>4"] = { "<cmd>BufferLineGoToBuffer 4<CR>", "go to buffer 4" },
    ["<leader>5"] = { "<cmd>BufferLineGoToBuffer 5<CR>", "go to buffer 5" },
    ["<leader>6"] = { "<cmd>BufferLineGoToBuffer 6<CR>", "go to buffer 6" },
    ["<leader>7"] = { "<cmd>BufferLineGoToBuffer 7<CR>", "go to buffer 7" },
    ["<leader>8"] = { "<cmd>BufferLineGoToBuffer 8<CR>", "go to buffer 8" },
    ["<leader>9"] = { "<cmd>BufferLineGoToBuffer 9<CR>", "go to buffer 9" },

    -- close buffer + hide terminal buffer
    ["<leader>bd"] = {
      function()
        vim.cmd(":bp | bd" .. vim.fn.bufnr())
      end,
      "   close buffer",
    },

    ["<leader>bca"] = { "<cmd>BufferLineGroupClose ungrouped<CR>", "   close all buffers" },
  },
}

default_bindings.comment = {

  -- toggle comment in both modes
  n = {
    ["<leader>/"] = {
      function()
        -- require("Comment.api").toggle_current_linewise()
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

    -- focus
    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "   focus nvimtree" },
  },
}

default_bindings.telescope = {
  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "  find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "  find all" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "   live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "  find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "  help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "   find oldfiles" },
    ["<leader>tk"] = { "<cmd> Telescope keymaps <CR>", "   show keys" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "   git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "  git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "   pick hidden term" },
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

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "   lsp hover",
    },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "   lsp implementation",
    },

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "   lsp signature_help",
    },

    ["<leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "   lsp definition type",
    },

    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "   lsp code_action",
    },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "   lsp references",
    },

    ["<leader>f"] = {
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
        vim.lsp.buf.formatting()
      end,
      "   lsp formatting",
    },

    ["<leader>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "   add workspace folder",
    },

    ["<leader>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "   remove workspace folder",
    },

    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "   list workspace folders",
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
