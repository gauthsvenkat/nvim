local u = require("utils")

return {
    "jay-babu/mason-null-ls.nvim",
    lazy = false,
    dependencies = {
        "williamboman/mason.nvim",
        "nvimtools/none-ls.nvim",
        "nvim-lua/plenary.nvim",
    },
    init = function()
        u.register_group_with_whichkey("<leader>pn", "NullLs")
    end,
    config = function()
        require("null-ls").setup({ fallback_severity = vim.diagnostic.severity.INFO })
        -- this will cause all sources to be registered with null-ls
        require("mason-null-ls").setup({ handlers = {} })
    end,
    keys = {
        { "<leader>pnn", u._cmd("NullLsInfo"), desc = "Show NullLs info" },
        { "<leader>pnl", u._cmd("NullLsLog"), desc = "Show NullLs logs" },
    },
}
