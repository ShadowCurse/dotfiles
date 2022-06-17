local M = {}

function M.config()
  local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
  if not status_ok then
    return
  end

  -- local default_opts = {
  --   ensure_installed = {},
  --   sync_install = false,
  --   ignore_install = {},
  --   highlight = {
  --     enable = true,
  --     additional_vim_regex_highlighting = false,
  --   },
  --   context_commentstring = {
  --     enable = true,
  --     enable_autocmd = false,
  --   },
  --   autopairs = {
  --     enable = true,
  --   },
  --   incremental_selection = {
  --     enable = true,
  --   },
  --   indent = {
  --     enable = true,
  --   },
  --   rainbow = {
  --     enable = true,
  --     disable = { "html" },
  --     extended_mode = false,
  --     max_file_lines = nil,
  --   },
  --   autotag = {
  --     enable = true,
  --   },
  -- }
  --
  -- treesitter.setup(vim.tbl_deep_extend("force", {}, default_opts, {}))
  treesitter.setup {
    -- A list of parser names, or "all"
    ensure_installed = {},

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- List of parsers to ignore installing (for "all")
    ignore_install = {},

    highlight = {
      -- `false` will disable the whole extension
      enable = true,

      -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
      -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
      -- the name of the parser)
      -- list of language that will be disabled
      disable = {},

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
  }
end

return M
