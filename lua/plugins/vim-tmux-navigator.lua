local u = require("utils")

return {
    "christoomey/vim-tmux-navigator",
    keys = {
        { "<C-h>", u._cmd("TmuxNavigateLeft"), desc = "Move to left window" },
        { "<C-j>", u._cmd("TmuxNavigateDown"), desc = "Move to bottom window" },
        { "<C-k>", u._cmd("TmuxNavigateUp"), desc = "Move to top window" },
        { "<C-l>", u._cmd("TmuxNavigateRight"), desc = "Move to right window" },
    },
}
