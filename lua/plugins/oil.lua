local cmd = require("utils").cmd

return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    keymaps = {
      ["<BS>"] = "actions.parent",
      ["<Esc>"] = "actions.close",
    },
  },
  keys = {
    { "<BS>", cmd("Oil --float"), desc = "Open parent directory" },
  },
}
