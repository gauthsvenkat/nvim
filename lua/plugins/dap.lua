return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")

            vim.keymap.set("n", "<F1>", dap.repl.toggle, { desc = "Debugger | Toggle REPL" })
            vim.keymap.set("n", "<F3>", dap.toggle_breakpoint, { desc = "Debugger | Toggle Breakpoint" })
            vim.keymap.set("n", "<F4>", function()
                dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end, { desc = "Debugger | Toggle Breakpoint" })
            vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debugger | Start/Continue debugging" })
            vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debugger | Step over" })
            vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debugger | Step into" })
            vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debugger | Step out" })
        end,
    },
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
        "mfussenegger/nvim-dap-python",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        config = function()
            local debugpy_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(debugpy_path)
        end,
    },
    -- {
    --     "jay-babu/mason-nvim-dap.nvim",
    --     dependencies = {
    --         "williamboman/mason.nvim",
    --         "mfussenegger/nvim-dap",
    --     },
    --     opts = {
    --         handlers = {
    --             function(config)
    --                 require("mason-nvim-dap").default_setup(config)
    --             end,
    --         },
    --     },
    -- },
}
