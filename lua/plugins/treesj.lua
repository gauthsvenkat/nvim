local cmd = require("utils").cmd

return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {},
  keys = {
    {
      "<leader>tj",
      cmd("TSJToggle"),
      desc = "treesj",
    },
  },
}
