return {
    { "williamboman/mason.nvim", opts = {} },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp" },
        config = function()
            local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
            require("mason-lspconfig").setup({
                handlers = {
                    -- first entry without a server name is the default handler
                    function(server_name)
                        require("lspconfig")[server_name].setup({ capabilities = lsp_capabilities })
                    end,
                },
            })
            -- configure diagnostics
            vim.diagnostic.config({
                virtual_text = false,
                signs = true,
                underline = true,
                update_in_insert = true,
                severity_sort = true,
            })
        end,
    },
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
