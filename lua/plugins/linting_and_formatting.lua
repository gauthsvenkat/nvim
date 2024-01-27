local u = require("utils")

return {
    "jay-babu/mason-null-ls.nvim",
    event = "BufEnter",
    dependencies = {
        {
            "nvimtools/none-ls.nvim",
            init = function()
                u.register_group_with_whichkey("<leader>pn", "NullLs")
            end,
            opts = {
                fallback_severity = vim.diagnostic.severity.INFO,
            },
        },
        "williamboman/mason.nvim",
        "nvim-lua/plenary.nvim",
    },
    opts = {
        handlers = {},
    },
    keys = {
        { "<leader>pnn", u._cmd("NullLsInfo"), desc = "Show NullLs info" },
        { "<leader>pnl", u._cmd("NullLsLog"), desc = "Show NullLs logs" },
    },
}
