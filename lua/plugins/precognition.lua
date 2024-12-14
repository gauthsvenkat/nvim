local cmd = require("utils").cmd

return {
  "tris203/precognition.nvim",
  event = "VeryLazy",
  opts = {
    startVisible = false,
  },
  keys = {
    {
      "<localleader>",
      cmd("Precognition peek"),
    },
  },
}
