local u = require("utils")

return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        {
            "zbirenbaum/copilot-cmp",
            opts = {},
            dependencies = {
                "zbirenbaum/copilot.lua",
                build = ":Copilot auth",
                init = function()
                    u.register_group_with_whichkey("<leader>pc", "Copilot")
                end,
                opts = {
                    suggestion = { enabled = false },
                    panel = { enabled = false },
                },
                keys = {
                    { "<leader>pcc", u._cmd("Copilot status"), desc = "Copilot status" },
                    { "<leader>pct", u._cmd("Copilot toggle"), desc = "Toggle Copilot" },
                    { "<leader>pcs", u._cmd("Copilot panel"), desc = "Open panel suggestions" },
                },
            },
        },
        {
            "L3MON4D3/LuaSnip",
            dependencies = { "rafamadriz/friendly-snippets" },
            build = "make install_jsregexp",
        },
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        "onsails/lspkind.nvim",
    },
    config = function()
        -- setup autocompletion
        require("luasnip/loaders/from_vscode").lazy_load()

        local luasnip = require("luasnip")
        local cmp = require("cmp")
        local lspkind = require("lspkind")

        cmp.setup({
            -- preselect = cmp.PreselectMode.None,
            sources = cmp.config.sources({
                -- lspconfig is assumed to be setup
                { name = "nvim_lsp", keyword_length = 3 },
                { name = "luasnip", keyword_length = 3 },
                { name = "copilot", keyword_length = 1 },
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
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            formatting = {
                format = lspkind.cmp_format({
                    mode = "text_symbol",
                    maxwidth = 50,
                    ellipsis_char = "...",
                    symbol_map = { Copilot = "" },
                }),
            },
            experimental = {
                ghost_text = true,
            },
        })
        -- use buffer source for ? and / search
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = { {
                name = "buffer",
            } },
        })
        -- user cmdline source for : commands
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
