return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp" },
    -- setup mason-lspconfig with a handler to automatically attach lsp
    config = function()
        local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
        require("mason-lspconfig").setup({
            handlers = {
                -- function to call when a language server is available
                function(server_name)
                    require("lspconfig")[server_name].setup({ capabilities = lsp_capabilities })
                end,
            },
        })
    end,
}
