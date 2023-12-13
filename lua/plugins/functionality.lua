return {
    -- Check integration with nvim-cmp and treesitter
    {
        "windwp/nvim-autopairs",
        config = true,
    },
    {
        "tpope/vim-sleuth",
    },
    {
        "numToStr/Comment.nvim",
        config = true,
    },
    {
        "unblevable/quick-scope",
        init = function()
            vim.g.qs_highlight_on_keys = { "f", "F" }
        end,
    },
    { "nvim-tree/nvim-tree.lua", opts = { renderer = { highlight_git = true } } },
    { "akinsho/toggleterm.nvim", config = true },
    { "mbbill/undotree" },
}
