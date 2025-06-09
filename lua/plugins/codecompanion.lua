local cmd = require("utils").cmd

return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      opts = { suggestion = { enabled = false }, panel = { enabled = false } },
    },
  },
  opts = {},
  keys = {
    { "<leader>cc", cmd("CodeCompanionChat toggle"), desc = "[c]hat" },
    { "<leader>ca", cmd("CodeCompanionActions"), desc = "[a]ctions" },
  },
  cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions", "CodeCompanionCmd" },
}
