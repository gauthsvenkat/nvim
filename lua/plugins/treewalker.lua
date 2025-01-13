local cmd = require("utils").cmd

return {
  "aaronik/treewalker.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "folke/which-key.nvim",
  },
  opts = {
    highlight = true,
    highlight_duration = 250,
  },
  config = function(_, opts)
    local wk = require("which-key")
    local buffer = vim.api.nvim_get_current_buf()

    require("treewalker").setup(opts)

    if require("nvim-treesitter.parsers").has_parser() then
      wk.add({ "<Left>", cmd("Treewalker Left"), buffer = buffer })
      wk.add({ "<Down>", cmd("Treewalker Down"), buffer = buffer })
      wk.add({ "<Up>", cmd("Treewalker Up"), buffer = buffer })
      wk.add({ "<Right>", cmd("Treewalker Right"), buffer = buffer })
    end
  end,
  keys = {
    {
      "<Left>",
      desc = "Treewalker left",
    },
    {
      "<Down>",
      desc = "Treewalker down",
    },
    {
      "<Up>",
      desc = "Treewalker up",
    },
    {
      "<Right>",
      desc = "Treewalker right",
    },
  },
}
