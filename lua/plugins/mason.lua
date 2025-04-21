local cmd = require("utils").cmd

return {
  "williamboman/mason.nvim",
  cond = not vim.g.vscode,
  lazy = false,
  opts = {},
  keys = {
    { "<leader>pm", cmd("Mason"), desc = "[m]ason" },
  },
}
