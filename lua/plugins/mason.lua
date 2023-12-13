return {
    {
        "williamboman/mason.nvim",
        config = true,
    },
    { "nvimtools/none-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" }, config = true },
    {
        "jay-babu/mason-null-ls.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
        opts = {
            handlers = {},
        },
    },
}
