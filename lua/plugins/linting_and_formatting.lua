return {
    {
        "nvimtools/none-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            fallback_severity = vim.diagnostic.severity.INFO,
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
