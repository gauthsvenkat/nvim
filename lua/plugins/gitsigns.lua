local cmd = require("utils").cmd
return {
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "<leader>gb", cmd("Gitsigns toggle_current_line_blame"), desc = "[b]lame toggle" },
      { "<leader>gd", cmd("Gitsigns toggle_deleted"), desc = "[d]eleted toggle" },
      { "<leader>gl", cmd("Gitsigns toggle_numhl"), desc = "[l]ine number toggle" },
      { "<leader>gv", cmd("Gitsigns preview_hunk"), desc = "pre[v]iew hunk" },
      { "<leader>gn", cmd("Gitsigns next_hunk"), desc = "[n]ext hunk" },
      { "<leader>gp", cmd("Gitsigns previous_hunk"), desc = "[p]revious hunk" },
      { "<leader>gr", cmd("Gitsigns reset_hunk"), desc = "[r]eset hunk" },
      { "<leader>gR", cmd("Gitsigns reset_buffer"), desc = "[R]eset buffer" },
      { "<leader>gs", cmd("Gitsigns stage_hunk"), desc = "[s]tage hunk" },
      { "<leader>gS", cmd("Gitsigns stage_buffer"), desc = "[S]tage buffer" },
      { "<leader>gu", cmd("Gitsigns undo_stage_hunk"), desc = "[u]ndo stage hunk" },
      { "<leader>gw", cmd("Gitsigns toggle_word_diff"), desc = "[w]ord diff toggle" },
    },
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      kind = "floating",
    },
    keys = {
      { "<leader>gg", cmd("Neogit"), desc = "neo[g]it" },
    },
  },
}
