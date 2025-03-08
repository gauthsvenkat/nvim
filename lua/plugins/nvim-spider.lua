local cmd = require("utils").cmd

return {
  "chrisgrieser/nvim-spider",
  keys = {
    { "<Tab>", cmd("lua require('spider').motion('w')"), desc = "Spider motion forward" },
    { "<S-Tab>", cmd("lua require('spider').motion('b')"), desc = "Spider motion backward" },
  },
}
