return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        opts = {},
        config = function(_, opts)
            local dapui = require("dapui")
            dapui.setup(opts)

            local dap = require("dap")
            -- have dapui automagically open when debugging
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        opts = {},
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
            "mfussenegger/nvim-dap-python",
        },
        opts = {
            handlers = {
                function(config)
                    require("mason-nvim-dap").default_setup(config)
                end,
                -- Use nvim-dap-python instead of the default handler
                python = function(_)
                    local debugpy_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
                    require("dap-python").setup(debugpy_path)
                end,
            },
        },
    },
}
