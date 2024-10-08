local cmd = require("utils").cmd

return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    { "<leader>gb", cmd("Gitsigns toggle_current_line_blame"), desc = "Gitsigns toggle blame" },
    { "<leader>gd", cmd("Gitsigns toggle_deleted"), desc = "Gitsigns toggle deleted" },
    { "<leader>gg", cmd("Gitsigns toggle_signs"), desc = "Gitsigns toggle signs" },
    { "<leader>gG", cmd("Gitsigns toggle_numhl"), desc = "Gitsigns toggle line number highlight" },
    { "<leader>gp", cmd("Gitsigns preview_hunk_inline"), desc = "Gitsigns preview hunk (inline)" },
    { "<leader>gP", cmd("Gitsigns preview_hunk"), desc = "Gitsigns preview hunk (window)" },
    { "<leader>gn", cmd("Gitsigns next_hunk"), desc = "Gitsigns next hunk" },
    { "<leader>gN", cmd("Gitsigns previous_hunk"), desc = "Gitsigns previous hunk" },
    { "<leader>gr", cmd("Gitsigns reset_hunk"), desc = "Gitsigns reset hunk" },
    { "<leader>gR", cmd("Gitsigns reset_buffer"), desc = "Gitsigns reset buffer" },
    { "<leader>gs", cmd("Gitsigns stage_hunk"), desc = "Gitsigns stage hunk" },
    { "<leader>gS", cmd("Gitsigns stage_buffer"), desc = "Gitsigns stage buffer" },
    { "<leader>gu", cmd("Gitsigns undo_stage_hunk"), desc = "Gitsigns undo stage hunk" },
    { "<leader>gw", cmd("Gitsigns toggle_word_diff"), desc = "Gitsigns toggle word diff" },
  },
}
