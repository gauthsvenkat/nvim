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
    { "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" }, build = "make install_jsregexp" },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh6th/cmp-path",
            "hrsh6th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "zbirenbaum/copilot-cmp",
            "onsails/lspkind.nvim",
        },
        -- setup function for nvim-cmp
        config = function()
            -- Helper function to identify if there are words before cursor.
            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0
                    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end
            -- setup autocompletion
            require("luasnip/loaders/from_vscode").lazy_load()

            local luasnip = require("luasnip")
            local cmp = require("cmp")
            local lspkind = require("lspkind")

            cmp.setup({
                -- preselect = cmp.PreselectMode.None,
                sources = cmp.config.sources({
                    -- lspconfig is assumed to be setup
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "copilot" },
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
                        elseif has_words_before() then
                            cmp.complete()
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
    },
}
