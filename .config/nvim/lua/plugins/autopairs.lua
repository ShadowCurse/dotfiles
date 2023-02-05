return {
  "windwp/nvim-autopairs",

  dependencies = {
    "nvim-cmp",
  },

  config = function()
    local nvim_autopairs = require("nvim-autopairs")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")

    nvim_autopairs.setup()
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end
}
--
-- local present1, autopairs = pcall(require, "nvim-autopairs")
-- local present2, cmp = pcall(require, "cmp")
--
-- if not present1 and present2 then
--   return
-- end
--
-- autopairs.setup()
--
-- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
