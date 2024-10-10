local cmd = require("utils").cmd

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    spec = {
      -- Window navigation
      { "<C-h>", cmd("wincmd h"), desc = "Move to window left" },
      { "<C-j>", cmd("wincmd j"), desc = "Move to window down" },
      { "<C-k>", cmd("wincmd k"), desc = "Move to window up" },
      { "<C-l>", cmd("wincmd l"), desc = "Move to window right" },

      -- Window moving
      { "<C-S-h>", cmd("wincmd H"), desc = "Move window left" },
      { "<C-S-j>", cmd("wincmd J"), desc = "Move window down" },
      { "<C-S-k>", cmd("wincmd K"), desc = "Move window up" },
      { "<C-S-l>", cmd("wincmd L"), desc = "Move window right" },

      -- Window resizing
      { "<C-Left>", cmd("vertical resize -2"), desc = "Decrease window width" },
      { "<C-Down>", cmd("resize -2"), desc = "Decrease window height" },
      { "<C-Up>", cmd("resize +2"), desc = "Increase window height" },
      { "<C-Right>", cmd("vertical resize +2"), desc = "Increase window width" },

      -- Window splitting
      { "<C-s>=", cmd("wincmd ="), desc = "Make splits equal size" },
      { "<C-s>h", cmd("aboveleft vsplit"), desc = "Split vertical (left)" },
      { "<C-s>j", cmd("belowright split"), desc = "Split horizontal (below)" },
      { "<C-s>k", cmd("aboveleft split"), desc = "Split horizontal (above)" },
      { "<C-s>l", cmd("belowright vsplit"), desc = "Split vertical (right)" },

      -- Buffer navigation
      { "<Tab>", cmd("bnext"), desc = "Buffer next" },
      { "<S-Tab>", cmd("bprevious"), desc = "Buffer previous" },

      -- Leader mappings
      { "<leader>b", group = "Buffer" },
      { "<leader>bn", cmd("bnext"), desc = "Buffer next" },
      { "<leader>bp", cmd("bprevious"), desc = "Buffer previous" },
      { "<leader>bd", cmd("bd"), desc = "Buffer delete" },

      { "<leader>c", group = "Comment", mode = { "n", "v" } },
      { "<leader>C", group = "Comment (block)", mode = { "n", "v" } },

      { "<leader>f", group = "Telescope" },

      { "<leader>g", group = "Gitsigns" },

      { "<leader>i", group = "Indent Blankline" },

      --TODO: Keymap for disabling diagnostics
      { "<leader>l", group = "LSP" },

      { "<leader>p", group = "Plugin managers" },
      { "<leader>pl", cmd("Lazy"), desc = "Lazy" },

      { "<leader>s", group = "Surround", mode = { "n", "v" } },
      { "<leader>S", group = "Surround (line)", mode = { "n", "v" } },
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
