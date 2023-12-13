return {
    "tpope/vim-sleuth",
    "mbbill/undotree",
    -- Check integration with nvim-cmp and treesitter
    {
        "windwp/nvim-autopairs",
        config = true,
    },
    {
        "numToStr/Comment.nvim",
        config = true,
    },
    { "akinsho/toggleterm.nvim", config = true },
    {
        "unblevable/quick-scope",
        init = function()
            vim.g.qs_highlight_on_keys = { "f", "F" }
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = true,
    },
    { "nvim-tree/nvim-tree.lua", opts = { renderer = { highlight_git = true } } },
}
