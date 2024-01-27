local u = require("utils")

return {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    lazy = false,
    opts = {},
    keys = {
        { "<leader>pm", u._cmd("Mason"), desc = "Open Mason" },
    },
}
