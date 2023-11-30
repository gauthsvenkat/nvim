return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "neovim/nvim-lspconfig",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-buffer",
        "hrsh6th/cmp-path",
        "hrsh6th/cmp-cmdline",
        { "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
        {
            "zbirenbaum/copilot-cmp",
            dependencies = {
                {
                    "zbirenbaum/copilot.lua",
                    build = ":Copilot auth",
                    opts = {
                        suggestion = { enabled = false },
                        panel = { enabled = false },
                    },
                },
            },
            config = true,
        },
    },
    -- setup function for nvim-cmp
    config = function()
        -- setup autocompletion
        local cmp = require("cmp")
        cmp.setup({
            sources = cmp.config.sources({
                { name = "copilot" },
                -- lspconfig is assumed to be setup
                { name = "nvim_lsp" },
                { name = "luasnip" },
            }, {
                { name = "buffer" },
            }),
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
        })
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
        })
    end,
}
