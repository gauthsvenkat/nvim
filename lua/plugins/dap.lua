return {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        {
            "rcarriga/nvim-dap-ui",
            dependencies = {
                "mfussenegger/nvim-dap",
                {
                    "theHamsta/nvim-dap-virtual-text",
                    dependencies = { "mfussenegger/nvim-dap" },
                    config = true,
                },
            },
            config = true,
        },
    },
    opts = {
        handlers = {
            function(config)
                require("mason-nvim-dap").default_setup(config)
            end,
        },
    },
}
