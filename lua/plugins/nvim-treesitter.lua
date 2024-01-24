return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = { "RRethy/nvim-treesitter-textsubjects" },
        build = ":TSUpdate",
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
                prev_selection = "j",
                keymaps = {
                    ["k"] = "textsubjects-smart",
                },
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        "mfussenegger/nvim-treehopper",
        dependencies = { "nvim-treesitter/nvim-treesitter", "smoka7/hop.nvim" },
    },
}
