return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300

        local wk = require("which-key")
        wk.setup()

        wk.register({
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
            i = {
                name = "Indent Guide",
                i = { "<cmd>IBLToggle<cr>", "Toggle Indent Guide" },
                s = { "<cmd>IBLToggleScope<cr>", "Toggle Scope Guide" },
            },
            t = {
                name = "Terminal",
                t = { "<cmd>ToggleTerm direction=horizontal size=10<cr>", "Bottom terminal" },
                f = { "<cmd>ToggleTerm direction=float<cr>", "Floating terminal" },
            },
            l = {
                name = "LSP Config",
                m = { "<cmd>Mason<cr>", "Mason" },
                i = { "<cmd>LspInfo<cr>", "LSP info" },
                s = { "<cmd>LspStart<cr>", "Start LSP" },
                e = { "<cmd>LspStop<cr>", "End LSP" },
                r = { "<cmd>LspRestart<cr>", "Restart LSP" },
                n = { "<cmd>LspInstall<cr>", "Install LSP (for current filetype)" },
            },
            ["p"] = { "<cmd>Lazy<cr>", "Lazy" },
            ["u"] = { "<cmd>UndotreeToggle<cr>", "Toggle Undotree" },
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
