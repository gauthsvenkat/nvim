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

        -- Some terminal windows that can be bound to keys
        local terminal_factory = require("toggleterm.terminal").Terminal
        local terminal = terminal_factory:new({
            cmd = u.get_exe_if_exists("zsh"),
            direction = "float",
        })
        local python_terminal = terminal_factory:new({
            cmd = u.get_exe_if_exists(".venv/bin/ipython")
                or u.get_exe_if_exists(".venv/bin/python")
                or u.get_exe_if_exists("python3")
                or u.get_exe_if_exists("python"),
            direction = "float",
        })
        local lazygit_terminal = terminal_factory:new({
            cmd = u.get_exe_if_exists("lazygit"),
            direction = "float",
        })

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
            f = {
                name = "Telescope",
                f = { u._cmd("Telescope find_files"), "Find files" },
                t = { u._cmd("Telescope live_grep"), "Find file with matching text" },
                s = { u._cmd("Telescope grep_string"), "Find string in current working directory" },

                b = { u._cmd("Telescope buffers"), "Find buffer" },
                c = { u._cmd("Telescope command_history"), "Find command in history" },
                h = { u._cmd("Telescope search_history"), "Find search history" },
                k = { u._cmd("Telescope keymaps"), "Find (normal mode) keymaps" },
                v = { u._cmd("Telescope treesitter"), "Find (treesitter) variables" },
            },
            g = {
                name = "Git",
                s = { u._cmd("Telescope git_status"), "Git status" },
                S = { u._cmd("Telescope git_stash"), "Git stash" },
                b = { u._cmd("Telescope git_branches"), "Git branches" },
                c = { u._cmd("Telescope git_commits"), "Git commits" },
                f = { u._cmd("Telescope git_bcommits"), "Git buffer commits" },
                B = { u._cmd("Gitsigns toggle_current_line_blame"), "Toggle current line blame" },
                d = { u._cmd("Gitsigns toggle_deleted"), "Toggle deleted" },
                w = { u._cmd("Gitsigns toggle_word_diff"), "Toggle word diff" },
                n = { u._cmd("Gitsigns next_hunk"), "Next hunk" },
                p = { u._cmd("Gitsigns prev_hunk"), "Previous hunk" },
            },
            -- Use space to Hop around in the buffer
            ["<leader>"] = { u._cmd("HopWord"), "Hop to any word in buffer" },
            ["1"] = { u._cmd("HopChar1"), "Hop with 1 char" },
            l = {
                name = "LSP functions",
                d = { u._cmd("Telescope lsp_definitions"), "Goto definition" },
                D = { u._cmd("Telescope diagnostics"), "Show diagnostics" },
                i = { u._cmd("Telescope lsp_incoming_calls"), "Show incoming calls" },
                I = { u._cmd("Telescope lsp_implementations"), "Goto implementation" },
                o = { u._cmd("Telescope lsp_outgoing_calls"), "Show outgoing calls" },
                t = { u._cmd("Telescope lsp_type_definitions"), "Goto type definition" },
                r = { u._cmd("Telescope lsp_references"), "Show references" },
                f = { vim.lsp.buf.format, "Format buffer" },
                h = { vim.lsp.buf.hover, "Show hover" },
                s = { vim.lsp.buf.signature_help, "Show signature help" },
                R = { vim.lsp.buf.rename, "Rename" },
                a = { vim.lsp.buf.code_action, "Code action" },
                n = { vim.diagnostic.goto_next, "Goto next diagnostic" },
                p = { vim.diagnostic.goto_prev, "Goto prev diagnostic" },
            },
            n = {
                name = "NeoTest",
                r = { require("neotest").run.run, "Run nearest test" },
                d = {
                    function()
                        require("neotest").run.run({ strategy = "dap" })
                    end,
                    "Debug nearest test",
                },
                f = {
                    function()
                        require("neotest").run.run(vim.fn.expand("%"))
                    end,
                    "Run current file",
                },
                s = { u._cmd("Neotest summary"), "Toggle test summary" },
                o = { u._cmd("Neotest output"), "Toggle test output" },
            },
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
            s = { require("tsht").nodes, "Start selecting nodes with Hop" },
            ["\\"] = {
                name = "Terminal",
                ["\\"] = {
                    function()
                        terminal:toggle()
                    end,
                    "Floating terminal",
                },
                g = {
                    function()
                        lazygit_terminal:toggle()
                    end,
                    "Lazygit",
                },
                p = {
                    function()
                        python_terminal:toggle()
                    end,
                    "Python REPL",
                },
            },
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
            mode = "n", -- NORMAL mode
            prefix = "<leader>",
            buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
            silent = true, -- use `silent` when creating keymaps
            noremap = true, -- use `noremap` when creating keymaps
            nowait = false, -- use `nowait` when creating keymaps
            expr = false, -- use `expr` when creating keymaps
        })

        -- visual mode mappings
        wk.register({
            ["lf"] = { vim.lsp.buf.format, "Range Format" },
        }, {
            mode = "v",
            prefix = "<leader>",
            buffer = nil,
            silent = true,
            noremap = true,
            nowait = false,
            expr = false,
        })
    end,
}
