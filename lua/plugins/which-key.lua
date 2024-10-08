local cmd = require("utils").cmd

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    spec = {
      -- Ctrl mappings
      -- Window navigation
      { "<C-h>", cmd("wincmd h"), desc = "Window left" },
      { "<C-j>", cmd("wincmd j"), desc = "Window down" },
      { "<C-k>", cmd("wincmd k"), desc = "Window up" },
      { "<C-l>", cmd("wincmd l"), desc = "Window right" },

      -- Window moving
      { "<C-S-h>", cmd("wincmd H"), desc = "Window left" },
      { "<C-S-j>", cmd("wincmd J"), desc = "Window down" },
      { "<C-S-k>", cmd("wincmd K"), desc = "Window up" },
      { "<C-S-l>", cmd("wincmd L"), desc = "Window right" },

      -- Splits
      { "<C-s>h", cmd("aboveleft vsplit"), desc = "Split vertical (left)" },
      { "<C-s>j", cmd("belowright split"), desc = "Split horizontal (below)" },
      { "<C-s>k", cmd("aboveleft split"), desc = "Split horizontal (above)" },
      { "<C-s>l", cmd("belowright vsplit"), desc = "Split vertical (right)" },

      -- Buffer navigation
      { "<C-,>", cmd("bprevious"), desc = "Buffer previous" },
      { "<C-.>", cmd("bnext"), desc = "Buffer next" },

      -- Leader mappings
      { "<leader>f", group = "Telescope" },

      { "<leader>g", group = "Gitsigns" },

      { "<leader>i", group = "Indent Blankline" },

      { "<leader>q", group = "Quit" },
      { "<leader>qq", cmd("quit"), desc = "Quit window" },
      { "<leader>qf", cmd("quit!"), desc = "Quit force" },
      { "<leader>qa", cmd("qall"), desc = "Quit all" },

      { "<leader>w", group = "Write" },
      { "<leader>ww", cmd("write"), desc = "Write buffer" },
      { "<leader>wa", cmd("wall"), desc = "Write all buffers" },
      { "<leader>wq", cmd("wq"), desc = "Write buffer and quit" },

      { "<leader>/", group = "Comment (line)" },
      { "<leader>?", group = "Comment (block)" },
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
