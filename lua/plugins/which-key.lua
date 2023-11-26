return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300

        local wk = require("which-key")
        wk.setup()

        wk.register({
            d = {
                name = "Debugger",
                d = { '<cmd>lua require("dapui").toggle()<cr>', "Toggle UI" },
                r = { '<cmd>lua require("dapui").open({reset = true})<cr>', "Reset UI" },
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
                c = { "<cmd>NvimTreeCollapse<cr>", "Collapse tree" },
                w = { "<cmd>NvimTreeFocus<cr>", "Focus on Explorer" },
            },
            f = {
                name = "Telescope",
                f = { "<cmd>Telescope find_files<cr>", "Find files" },
                t = { "<cmd>Telescope live_grep<cr>", "Find file with matching text" },

                s = { "<cmd> Telescope spell_suggest<cr>", "Suggest spellings" },

                d = { "<cmd> Telescope diagnostics<cr>", "Find diagnoses" },
                e = { "<cmd> Telescope lsp_definitions<cr>", "Goto or show definitions for current word" },
                r = { "<cmd> Telescope lsp_references<cr>", "Find references for current word" },
                i = { "<cmd> Telescope lsp_implementations<cr>", "Goto or show implementations for current word" },

                b = { "<cmd>Telescope buffers<cr>", "Find buffer" },
                c = { "<cmd>Telescope command_history<cr>", "Find command in history" },
                k = { "<cmd>Telescope keymaps<cr>", "Find (normal mode) keymaps" },
                v = { "<cmd>Telescope treesitter<cr>", "Find (treesitter) variables" },
            },
            g = {
                name = "Gitsigns",
                s = { "<cmd>Gitsigns toggle_signs<cr>", "Toggle signs" },
                n = { "<cmd>Gitsigns toggle_numhl<cr>", "Highlight line numbers" },
                l = { "<cmd>Gitsigns toggle_linehl<cr>", "Highlight changed lines" },
                w = { "<cmd>Gitsigns toggle_word_diff<cr>", "Show word diffs" },
                d = { "<cmd>Gitsigns toggle_deleted<cr>", "Show deleted lines" },
                b = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Show blame" },
                q = { "<cmd>Gitsigns prev_hunk<cr>", "Jump to prev hunk" },
                e = { "<cmd>Gitsigns next_hunk<cr>", "Jump to next hunk" },
                r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk" },
                c = { "<cmd>Telescope git_commits<cr>", "Show commits" },
                o = { "<cmd>Telescope git_branches<cr>", "Show branches" },
            },
            h = {
                name = "TreeSitter Options",
                c = { "<cmd>TSConfigInfo<cr>", "TreeSitter config info" },
                m = { "<cmd>TSModuleInfo<cr>", "TreeSitter module info" },
            },
            i = {
                name = "Indent Guide",
                i = { "<cmd>IBLToggle<cr>", "Toggle Indent Guide" },
                s = { "<cmd>IBLToggleScope<cr>", "Toggle Scope Guide" },
            },
            l = {
                name = "LSP options",
                i = { "<cmd>LspInfo<cr>", "LSP info" },
                s = { "<cmd>LspStart<cr>", "Start LSP" },
                e = { "<cmd>LspStop<cr>", "End LSP" },
                r = { "<cmd>LspRestart<cr>", "Restart LSP" },
                -- TODO make sure this is working correctly
                f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format file" },
            },
            m = {
                name = "Mason",
                m = { "<cmd>Mason<cr>", "Mason" },
                -- Dap Install doesn't work for some reason, can still use mason to install.
                l = { "<cmd>LspInstall<cr>", "Install LSP (for current filetype)" },
                f = { "<cmd>NullLsInstall<cr>", "Install linter/formatter (for current filtertype)" },
            },
            p = { "<cmd>Lazy<cr>", "Lazy Plugin Manager" },
            t = {
                name = "Terminal",
                t = { "<cmd>ToggleTerm direction=horizontal size=10<cr>", "Bottom terminal" },
                f = { "<cmd>ToggleTerm direction=float<cr>", "Floating terminal" },
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
