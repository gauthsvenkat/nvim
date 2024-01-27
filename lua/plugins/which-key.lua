return {
    "folke/which-key.nvim",
    opts = {},
    config = function(_, opts)
        -- make sure space isn't assigned to anything
        vim.keymap.set("", "<space>", "<nop>")
        local wk = require("which-key")
        wk.setup(opts)

        -- Import some helper functions
        local u = require("utils")

        -- some normal mode mappings to make life easier
        wk.register({
            -- keep search terms in the middle of the screen
            n = { "nzzzv", "Move to next search term" },
            N = { "Nzzzv", "Move to previous search term" },
            -- easier window navigation
            ["<C-h>"] = { u._cmd("TmuxNavigateLeft"), "Smart navigation left" },
            ["<C-j>"] = { u._cmd("TmuxNavigateDown"), "Smart navigation down" },
            ["<C-k>"] = { u._cmd("TmuxNavigateUp"), "Smart navigation up" },
            ["<C-l>"] = { u._cmd("TmuxNavigateRight"), "Smart navigation right" },
            -- easier buffer navigation
            ["<C-b>"] = { u._cmd("bprevious"), "Move to previous buffer" },
            ["<C-n>"] = { u._cmd("bnext"), "Move to next buffer" },
            ["<C-x>"] = { u._cmd("bdelete"), "Delete buffer" },
            -- resize window pane with arrows
            ["<C-Up>"] = { u._excmd("resize +2"), "Increase window height" },
            ["<C-Down>"] = { u._excmd("resize -2"), "Decrease window height" },
            ["<C-Left>"] = { u._excmd("vertical resize -2"), "Decrease window width" },
            ["<C-Right>"] = { u._excmd("vertical resize +2"), "Increase window width" },
            -- Dap mappings
            ["<F1>"] = { u._cmd("DapToggleRepl"), "Debugger | Toggle REPL" },
            ["<F3>"] = { u._cmd("DapToggleBreakpoint"), "Debugger | Toggle breakpoint" },
            ["<F4>"] = {
                function()
                    require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
                end,
                "Debugger | Toggle conditional breakpoint",
            },
            ["<F5>"] = { u._cmd("DapContinue"), "Debugger | Start/Continue debugging" },
            ["<F10>"] = { u._cmd("DapStepOver"), "Debugger | Step over" },
            ["<F11>"] = { u._cmd("DapStepInto"), "Debugger | Step into" },
            ["<F12>"] = { u._cmd("DapStepOut"), "Debugger | Step out" },
        }, {
            mode = "n",
            prefix = "",
            buffer = nil,
            silent = true,
            noremap = true,
            nowait = false,
            expr = false,
        })

        -- terminal mode mappings
        wk.register({
            -- exit terminal mode with <ESC>
            ["<C-h>"] = { "<C-\\><C-n><C-W>h", "Goto window left" },
            ["<C-j>"] = { "<C-\\><C-n><C-W>j", "Goto window down" },
            ["<C-k>"] = { "<C-\\><C-n><C-W>k", "Goto window up" },
            ["<C-l>"] = { "<C-\\><C-n><C-W>l", "Goto window right" },
            -- TODO: This interferes with lazygit and other stuff
            ["<Esc>"] = { "<C-\\><C-n>" .. u._cmd("ToggleTerm"), "Hide terminal" },
        }, {
            mode = "t",
            prefix = "",
            buffer = nil,
            silent = true,
            noremap = true,
            nowait = false,
            expr = false,
        })

        wk.register({

            p = {
                name = "Plugins",
                p = { u._cmd("Lazy"), "Open Lazy" },
                m = { u._cmd("Mason"), "Open Mason" },
                t = {
                    name = "Treesitter",
                    i = { u._cmd("TSInstallInfo"), "Install treesitter info" },
                    c = { u._cmd("TSConfigInfo"), "Show treesitter config" },
                },
                l = {
                    name = "LSP",
                    i = { u._cmd("LspInfo"), "Show LSP info" },
                    l = { u._cmd("LspLog"), "Show LSP log" },
                },
                c = {
                    name = "Copilot",
                    s = { u._cmd("Copilot status"), "Show Copilot status" },
                    t = { u._cmd("Copilot toggle"), "Toggle Copilot" },
                    p = { u._cmd("Copilot panel"), "Open panel suggestions" },
                },
                n = {
                    name = "NullLs",
                    i = { u._cmd("NullLsInfo"), "Show NullLs info" },
                    l = { u._cmd("NullLsLog"), "Show NullLs log" },
                },
            },
            -- TODO Might wanna come back to this later
            q = {
                name = "Quit",
                b = { u._excmd("bd"), "Close buffer" },
                B = { u._excmd("bd!"), "Close buffer without saving" },
                q = { u._excmd("q"), "Quit" },
                Q = { u._excmd("qa"), "Quit all" },
            },
            r = { ":%s///gc" .. string.rep("<Left>", 4), "Start search and replace" },
            R = { ":%s/\\<<C-r><C-w>\\>//g<Left><Left>", "Search and replace word under cursor" },
            w = {
                name = "Write",
                w = { u._excmd("w"), "Write" },
                a = { u._excmd("w"), "Write all" },
            },
            z = {
                name = "Fold",
                z = { "za", "Toggle fold" },
                o = { "zR", "Open all folds" },
                c = { "zM", "Close all folds" },
            },
        }, {
            mode = "n",     -- NORMAL mode
            prefix = "<leader>",
            buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
            silent = true,  -- use `silent` when creating keymaps
            noremap = true, -- use `noremap` when creating keymaps
            nowait = false, -- use `nowait` when creating keymaps
            expr = false,   -- use `expr` when creating keymaps
        })
    end,
}
