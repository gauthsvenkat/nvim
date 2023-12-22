return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = { "RRethy/nvim-treesitter-textsubjects" },
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "python", "c", "lua", "vim", "vimdoc", "query", "html" },
            auto_install = true,
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<leader>s",
                },
            },
            textsubjects = {
                enable = true,
                -- The following keymaps work in incremental_selection mode
                prev_selection = ",",
                keymaps = {
                    ["."] = "textsubjects-smart",
                },
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
            enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
            line_numbers = true,
            trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
            mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
        },
    },
    {
        "mfussenegger/nvim-treehopper",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            vim.keymap.set("n", "<leader>S", require("tsht").nodes, { desc = "Start selecting nodes in visual mode" })
        end,
    },
}
