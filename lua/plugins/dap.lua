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

            -- setup dap keymaps
            local opts = { noremap = true, silent = true }
            local keymap = vim.api.nvim_set_keymap

            keymap("n", "<F5>", "<cmd>lua require('dap').continue()<cr>", opts)
            keymap("n", "<F10>", "<cmd>lua require('dap').step_over()<cr>", opts)
            keymap("n", "<F11>", "<cmd>lua require('dap').step_into()<cr>", opts)
            keymap("n", "<F12>", "<cmd>lua require('dap').step_out()<cr>", opts)

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
        },
        opts = {
            handlers = {
                function(config)
                    require("mason-nvim-dap").default_setup(config)
                end,
            },
        },
    },
}
