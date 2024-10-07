local cmd = require("utils").cmd

return {
  "lukas-reineke/indent-blankline.nvim",
  opts = {
    enabled = false,
  },
  main = "ibl",
  keys = {
    { "<leader>ii", cmd("IBLToggle"), desc = "Indent Blankline toggle" },
    { "<leader>is", cmd("IBLToggleScope"), desc = "Indent Blankline scope toggle" },
  },
}
