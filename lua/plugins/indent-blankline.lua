local cmd = require("utils").cmd

return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  opts = { enabled = false },
  main = "ibl",
  keys = {
    { "<leader>ii", cmd("IBLToggle"), desc = "Indent Blankline toggle" },
    { "<leader>is", cmd("IBLToggleScope"), desc = "Indent Blankline scope toggle" },
  },
}
