local cmd = require("utils").cmd

return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    { "<leader>gb", cmd("Gitsigns toggle_current_line_blame"), desc = "[b]lame toggle" },
    { "<leader>gd", cmd("Gitsigns toggle_deleted"), desc = "[d]eleted toggle" },
    { "<leader>gg", cmd("Gitsigns toggle_signs"), desc = "[g]itsigns toggle" },
    { "<leader>gl", cmd("Gitsigns toggle_numhl"), desc = "[l]ine number toggle" },
    { "<leader>gp", cmd("Gitsigns preview_hunk_inline"), desc = "[p]review hunk (inline)" },
    { "<leader>gP", cmd("Gitsigns preview_hunk"), desc = "[P]review hunk (window)" },
    { "<leader>gn", cmd("Gitsigns next_hunk"), desc = "[n]ext hunk" },
    { "<leader>gN", cmd("Gitsigns previous_hunk"), desc = "[p]revious hunk" },
    { "<leader>gr", cmd("Gitsigns reset_hunk"), desc = "[r]eset hunk" },
    { "<leader>gR", cmd("Gitsigns reset_buffer"), desc = "[R]eset buffer" },
    { "<leader>gs", cmd("Gitsigns stage_hunk"), desc = "[s]tage hunk" },
    { "<leader>gS", cmd("Gitsigns stage_buffer"), desc = "[S]tage buffer" },
    { "<leader>gu", cmd("Gitsigns undo_stage_hunk"), desc = "[u]ndo stage hunk" },
    { "<leader>gw", cmd("Gitsigns toggle_word_diff"), desc = "[w]ord diff toggle" },
  },
}
