return {
  "folke/flash.nvim",
  opts = {},
  keys = {
    { "f", "F", "t", "T" },
    {
      "<Cr>",
      function()
        require("flash").jump()
      end,
      mode = { "n", "x", "o" },
      desc = "Flash",
    },
    {
      "<Cr><Cr>",
      function()
        require("flash").treesitter()
      end,
      mode = { "n", "x", "o" },
      desc = "Flash Treesitter",
    },
    {
      "r",
      function()
        require("flash").remote()
      end,
      mode = "o",
      desc = "Remote Flash",
    },
    {
      "R",
      function()
        require("flash").treesitter_search()
      end,
      mode = { "o", "x" },
      desc = "Treesitter Search",
    },
  },
}
