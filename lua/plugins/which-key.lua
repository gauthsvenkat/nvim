local cmd = require("utils").cmd

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    spec = {
      -- Ctrl mappings
      -- Splits
      { "<C-w>w", cmd("aboveleft split"), desc = "Split horizontal (above)" },
      { "<C-w>a", cmd("aboveleft vsplit"), desc = "Split vertical (left)" },
      { "<C-w>s", cmd("belowright split"), desc = "Split horizontal (below)" },
      { "<C-w>d", cmd("belowright vsplit"), desc = "Split vertical (right)" },

      -- Leader mappings
      { "<leader>b", desc = "Buffer" },
      { "<leader>bb", cmd("bprevious"), desc = "Buffer previous" },
      { "<leader>bd", cmd("bd"), desc = "Buffer delete" },
      { "<leader>bn", cmd("bnext"), desc = "Buffer next" },

      { "<leader>q", group = "Quit" },
      { "<leader>qq", cmd("quit"), desc = "Quit window" },
      { "<leader>qf", cmd("quit!"), desc = "Quit force" },
      { "<leader>qa", cmd("qall"), desc = "Quit all" },

      { "<leader>w", group = "Write" },
      { "<leader>ww", cmd("write"), desc = "Write buffer" },
      { "<leader>wa", cmd("wall"), desc = "Write all buffers" },
      { "<leader>wq", cmd("wq"), desc = "Write buffer and quit" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show()
      end,
      desc = "Buffer local keymaps (which-key)",
    },
  },
}
