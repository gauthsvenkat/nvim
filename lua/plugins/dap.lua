return {
    {
        "mfussenegger/nvim-dap",
        {
            "rcarriga/nvim-dap-ui",
            dependencies = { "mfussenegger/nvim-dap" },
            config = true,
        },
        {
            "theHamsta/nvim-dap-virtual-text",
            dependencies = { "mfussenegger/nvim-dap" },
            config = true,
        },
        {
            "jay-babu/mason-nvim-dap.nvim",
            dependencies = {
                "williamboman/mason.nvim",
            },
            opts = {
                handlers = {
                    function(config)
                        require("mason-nvim-dap").default_setup(config)
                    end,
                },
            },
        },
    },
}
