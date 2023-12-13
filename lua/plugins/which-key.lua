return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        local wk = require("which-key")
        wk.setup()

        wk.register({
            d = {
                name = "Debugger",
                d = { '<cmd>lua require("dapui").toggle()<cr>', "Toggle UI" },
                c = { "<cmd>DapContinue<cr>", "(Start or) Continue until next breakpoint" },
                b = { "<cmd>DapToggleBreakpoint<cr>", "Toggle Breakpoint" },
                o = { "<cmd>DapStepOver<cr>", "Step over" },
                i = { "<cmd>DapStepInto<cr>", "Step into" },
                u = { "<cmd>DapStepOut<cr>", "Step out" },
                q = { "<cmd>DapTerminate<cr>", "Stop the debug session" },
            },
            e = {
                name = "Explorer",
                e = { "<cmd>NvimTreeToggle<cr>", "Toggle Explorer" },
                f = { "<cmd>NvimTreeFindFile<cr>", "Find current file in Explorer" },
            },
            f = {
                name = "Telescope",
                f = { "<cmd>Telescope find_files<cr>", "Find files" },
                t = { "<cmd>Telescope live_grep<cr>", "Find file with matching text" },
            },
            i = {
                name = "Indent Guide",
                i = { "<cmd>IBLToggle<cr>", "Toggle Indent Guide" },
                s = { "<cmd>IBLToggleScope<cr>", "Toggle Scope Guide" },
            },
            l = {
                name = "LSP options",
                f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format file" },
            },
            t = {
                name = "Terminal",
                t = { "<cmd>ToggleTerm direction=horizontal size=10<cr>", "Bottom terminal" },
            },
            u = { "<cmd>UndotreeToggle<cr>", "Toggle Undotree" },
            ["<leader>"] = { "<cmd>WhichKey<cr>", "WhichKey" },
        }, {
            mode = "n", -- NORMAL mode
            prefix = "<leader>",
            buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
            silent = true, -- use `silent` when creating keymaps
            noremap = true, -- use `noremap` when creating keymaps
            nowait = false, -- use `nowait` when creating keymaps
            expr = false, -- use `expr` when creating keymaps
        })
    end,
}
