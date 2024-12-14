local cmd = require("utils").cmd

return {
  "tris203/precognition.nvim",
  opts = {
    startVisible = false,
  },
  keys = {
    {
      "<leader>tp",
      cmd("Precognition toggle"),
      desc = "[p]recognition",
    },
  },
}
