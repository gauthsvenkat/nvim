return {
    {
        "zbirenbaum/copilot.lua",
        build = ":Copilot auth",
        opts = {
            suggestion = { enabled = false },
            panel = { enabled = false },
        },
    },
    {
        "zbirenbaum/copilot-cmp",
        dependencies = { "zbirenbaum/copilot.lua" },
        opts = {},
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        build = "make install_jsregexp",
        config = function()
            local luasnip = require("luasnip")
            local s = luasnip.snippet
            local t = luasnip.text_node
            local i = luasnip.insert_node
            local c = luasnip.choice_node

            luasnip.add_snippets("python", {
                s({
                    name = "Import Dexter clients",
                    trig = "imp_dexclient",
                }, {
                    t("from dexter_api_client import "),
                    c(1, {
                        t("DexterAPIClient"),
                        t("DexterForecastAPIClient"),
                        t("DexterImbaAPIClient"),
                    }),
                }),
                s({
                    name = "Init Dexter client",
                    trig = "init_dexclient",
                }, {
                    t("client = "),
                    c(1, {
                        t("DexterAPIClient"),
                        t("DexterForecastAPIClient"),
                        t("DexterImbaAPIClient"),
                    }),
                    t("(host="),
                    c(2, {
                        t('"https://api.dexterenergyservices.com/"'),
                        t('"https://api-staging.dexterenergyservices.com/"'),
                        t('"https://api-testing.dexterenergyservices.com/"'),
                    }),
                    t(
                        ',version="v1",username=os.environ["DEXTER_API_PRODUCTION_USER"],password=os.environ["DEXTER_API_PRODUCTION_USER"])'
                    ),
                }),
            })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "zbirenbaum/copilot-cmp",
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
                    ["<C-n>"] = cmp.mapping(function(fallback)
                        if luasnip.choice_active() then
                            luasnip.change_choice(1)
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
    },
}
