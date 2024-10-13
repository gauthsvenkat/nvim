local cmd = require("utils").cmd

return {
  "folke/zen-mode.nvim",
  dependencies = { "folke/twilight.nvim" },
  opts = {
    plugins = {
      twilight = { enabled = true },
      gitsigns = { enabled = true },
    },
  },
  keys = {
    { "<leader>z", cmd("ZenMode"), desc = "[z]en mode toggle" },
  },
}
