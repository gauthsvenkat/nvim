-- TODO : Integrate with LSP, DAP and whatnot
return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = { handlers = {
            function(server_name)
                require("lspconfig")[server_name].setup({})
            end,
        } },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    },
}
