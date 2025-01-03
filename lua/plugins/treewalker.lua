local cmd = require("utils").cmd

return {
  "aaronik/treewalker.nvim",
  opts = {
    highlight = true,
    highlight_duration = 250,
  },
  keys = {
    {
      "<Left>",
      cmd("Treewalker Left"),
      desc = "Treewalker left",
    },
    {
      "<Down>",
      cmd("Treewalker Down"),
      desc = "Treewalker down",
    },
    {
      "<Up>",
      cmd("Treewalker Up"),
      desc = "Treewalker up",
    },
    {
      "<Right>",
      cmd("Treewalker Right"),
      desc = "Treewalker right",
    },
  },
}
