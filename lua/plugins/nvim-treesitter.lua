local u = require("utils")

return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = { "RRethy/nvim-treesitter-textsubjects" },
        build = ":TSUpdate",
        lazy = false,
        init = function()
            u.register_group_with_whichkey("<leader>pt", "Treesitter")
        end,
        opts = {
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "html", "yaml" },
            auto_install = true,
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<leader>S",
                },
            },
            textsubjects = {
                enable = true,
                -- The following keymaps work in incremental_selection mode
                prev_selection = "b",
                keymaps = {
                    ["n"] = "textsubjects-smart",
                },
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
        keys = {
            { "<leader>pti", u._cmd("TSToggle indent"), desc = "Toggle indent" },
            { "<leader>pth", u._cmd("TSToggle highlight"), desc = "Toggle highlight" },
        },
    },
    {
        "mfussenegger/nvim-treehopper",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        keys = {
            {
                "<leader>s",
                function()
                    require("tsht").nodes()
                end,
                desc = "Select TS nodes with Hop",
            },
        },
    },
}
