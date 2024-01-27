local u = require("utils")

return {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    init = function()
        u.register_group_with_whichkey("<leader>g", "Git")
    end,
    opts = {
        yadm = {
            enable = false,
        },
        numhl = true,
        linehl = false,
        word_diff = false,
    },
    keys = {
        { "<leader>gB", u._cmd("Gitsigns toggle_current_line_blame"), "Toggle line blame" },
        { "<leader>gd", u._cmd("Gitsigns toggle_deleted"), "Toggle deleted" },
        { "<leader>gw", u._cmd("Gitsigns toggle_word_diff"), "Toggle word diff" },
        { "<leader>gn", u._cmd("Gitsigns next_hunk"), "Next hunk" },
        { "<leader>gp", u._cmd("Gitsigns prev_hunk"), "Previous hunk" },
    },
}
