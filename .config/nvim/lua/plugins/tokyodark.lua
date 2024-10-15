return {
  "tiagovla/tokyodark.nvim",
  -- lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  -- priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- local config = {
    --   transparent_background = false,                                        -- set background to transparent
    --   gamma = 1.00,                                                          -- adjust the brightness of the theme
    --   styles = {
    --     comments = { italic = false },                                        -- style for comments
    --     keywords = { italic = false },                                        -- style for keywords
    --     identifiers = { italic = false },                                     -- style for identifiers
    --     functions = {},                                                      -- style for functions
    --     variables = {},                                                      -- style for variables
    --   },
    --   -- custom_highlights = {} or function(highlights, palette) return {} end, -- extend highlights
    --   -- custom_palette = {} or function(palette) return {} end,                -- extend palette
    --   terminal_colors = true,                                                -- enable terminal colors
    -- }
    -- require("tokyodark").setup(config)
    -- vim.cmd.colorscheme("tokyodark")
  end,
}
