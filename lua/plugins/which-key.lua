local cmd = require("utils").cmd

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    spec = {
      { "<C-h>", "<C-w>h", desc = "Left window" },
      { "<C-j>", "<C-w>j", desc = "Down window" },
      { "<C-k>", "<C-w>k", desc = "Up window" },
      { "<C-l>", "<C-w>l", desc = "Right window" },

      { "<C-q>", group = "Close" },
      { "<C-q>q", cmd("bd"), desc = "Close buffer" },

      { "<C-n>", cmd("bnext"), desc = "Next buffer" },
      { "<C-b>", cmd("bprevious"), desc = "Previous buffer" },

      { "<C-s>", group = "Split" },
      { "<C-s>w", cmd("aboveleft split"), desc = "Split horizontal (above)" },
      { "<C-s>a", cmd("aboveleft vsplit"), desc = "Split vertical (left)" },
      { "<C-s>s", cmd("belowright split"), desc = "Split horizontal (below)" },
      { "<C-s>d", cmd("belowright vsplit"), desc = "Split vertical (right)" },

      { "<leader>w", group = "Write" },
      { "<leader>ww", cmd("write"), desc = "Write buffer" },
      { "<leader>wa", cmd("wall"), desc = "Write all buffers" },
      { "<leader>wq", cmd("wq"), desc = "Write buffer and quit" },

      { "<leader>q", group = "Quit" },
      { "<leader>qq", cmd("quit"), desc = "Quit window" },
      { "<leader>qa", cmd("qall"), desc = "Quit all" },
    },
  },
}
