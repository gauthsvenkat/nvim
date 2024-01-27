local u = require("utils")

return {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
            "mfussenegger/nvim-dap-python",
            "mfussenegger/nvim-dap-virtual-text",
            "rcarriga/nvim-dap-ui",
        },
        opts = {
            handlers = {
                function(config)
                    require("mason-nvim-dap").default_setup(config)
                end,
                -- Use nvim-dap-python instead of the default handler
                python = function(_)
                    local debugpy_python_path =
                    u.get_exe_if_exists(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")
                    if debugpy_python_path then
                        require("dap-python").setup(debugpy_python_path)
                    else
                        print("Couldn't find python with debugpy module installed!")
                    end
                end,
            },
        },
        config = function(_, opts)
            local dap, dapui = require("dap"), require("dapui")

            require("mason-nvim-dap").setup(opts)
            require("nvim-dap-virtual-text").setup()
            dapui.setup()
            -- setup dapui related stuff
            dap.listeners.after.event_initialized["dapui_config"] = dapui.open
            dap.listeners.before.event_terminated["dapui_config"] = dapui.close
            dap.listeners.before.event_exited["dapui_config"] = dapui.close
        end,
        keys = {
            {
                "<F3>",
                u._cmd("DapToggleBreakpoint"),
                desc = "Toggle breakpoint",
            },
            {
                "<F4>",
                function()
                    require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
                end,
                desc = "Toggle conditional breakpoint",
            },
            {
                "<F5>",
                u._cmd("DapContinue"),
                desc = "Start/Continue debugging",
            },
            {
                "<F10>",
                u._cmd("DapStepOver"),
                desc = "Step over",
            },
            {
                "<F11>",
                u._cmd("DapStepInto"),
                desc = "Step into",
            },
            {
                "<F12>",
                u._cmd("DapStepOut"),
                desc = "Step out",
            },
        },
    }

