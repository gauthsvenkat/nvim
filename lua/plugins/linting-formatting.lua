return {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        { "nvimtools/none-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    opts = {
        handlers = {},
    },
}
