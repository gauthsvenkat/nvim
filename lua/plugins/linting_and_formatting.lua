local u = require("utils")

return {
    {
        "nvimtools/none-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        init = function()
            u.register_group_with_whichkey("<leader>pn", "NullLs")
        end,
        opts = {
            fallback_severity = vim.diagnostic.severity.INFO,
        },
        keys = {
            { "<leader>pnn", u._cmd("NullLsInfo"), desc = "Show NullLs info" },
            { "<leader>pnl", u._cmd("NullLsLog"), desc = "Show NullLs logs" },
        },
    },
    {
        "jay-babu/mason-null-ls.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        opts = {
            handlers = {}, -- this will cause all sources to be registered with null-ls
        },
    },
}
