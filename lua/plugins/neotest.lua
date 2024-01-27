local u = require("utils")

return {
    "nvim-neotest/neotest",
    init = function()
        u.register_group_with_whichkey("<leader>n", "Neotest")
    end,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-neotest/neotest-python",
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-python")({
                    dap = { justMyCode = true },
                }),
            },
        })
    end,
    keys = {
        {
            "<leader>nr",
            function()
                require("neotest").run.run()
            end,
            desc = "Run nearest test",
        },
        {
            "<leader>nd",
            function()
                require("neotest").run.run({ strategy = "dap" })
            end,
            desc = "Debug nearest test",
        },
        {
            "<leader>nf",
            function()
                require("neotest").run.run(vim.fn.expand("%"))
            end,
            desc = "Run current file",
        },
        {
            "<leader>ns",
            u._cmd("Neotest summary"),
            desc = "Toggle test summary",
        },
        {
            "<leader>no",
            u._cmd("Neotest output"),
            desc = "Toggle test output",
        },
    },
}
