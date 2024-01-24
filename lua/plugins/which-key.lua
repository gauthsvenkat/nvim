return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
        -- make sure space isn't assigned to anything
        vim.keymap.set("", "<space>", "<nop>")
        local wk = require("which-key")
        wk.setup(opts)

        -- easier binding to accomplish something cursed
        local get_if_exists = function(executable)
            return (vim.fn.executable(executable) == 1) and executable or nil
        end

        -- Some terminal windows that can be bound to keys
        local terminal_factory = require("toggleterm.terminal").Terminal
        local terminal = terminal_factory:new({
            cmd = get_if_exists("zsh"),
            direction = "float",
        })
        local python_terminal = terminal_factory:new({
            cmd = get_if_exists(".venv/bin/ipython")
                or get_if_exists(".venv/bin/python")
                or get_if_exists("python3")
                or get_if_exists("python"),
            direction = "float",
        })
        local lazygit_terminal = terminal_factory:new({
            cmd = get_if_exists("lazygit"),
            direction = "float",
        })

        -- helper function to wrap commands string with <cmd> and <cr>
        local _cmd = function(cmd_str)
            return "<cmd>" .. cmd_str .. "<cr>"
        end
        local _excmd = function(cmd_str)
            return ":" .. cmd_str .. "<cr>"
        end

        -- some normal mode mappings to make life easier
        wk.register({
            -- keep search terms in the middle of the screen
            n = { "nzzzv", "Move to next search term" },
            N = { "Nzzzv", "Move to previous search term" },
            -- easier window navigation
            ["<C-h>"] = { _cmd("TmuxNavigateLeft"), "Smart navigation left" },
            ["<C-j>"] = { _cmd("TmuxNavigateDown"), "Smart navigation down" },
            ["<C-k>"] = { _cmd("TmuxNavigateUp"), "Smart navigation up" },
            ["<C-l>"] = { _cmd("TmuxNavigateRight"), "Smart navigation right" },
            -- easier buffer navigation
            ["<C-n>"] = { _cmd("bprevious"), "Move to previous buffer" },
            ["<C-m>"] = { _cmd("bnext"), "Move to next buffer" },
            ["<C-x>"] = { _cmd("bdelete"), "Delete buffer" },
            -- resize window pane with arrows
            ["<C-Up>"] = { _excmd("resize +2"), "Increase window height" },
            ["<C-Down>"] = { _excmd("resize -2"), "Decrease window height" },
            ["<C-Left>"] = { _excmd("vertical resize -2"), "Decrease window width" },
            ["<C-Right>"] = { _excmd("vertical resize +2"), "Increase window width" },
            -- Dap mappings
            ["<F1>"] = { _cmd("DapToggleRepl"), "Debugger | Toggle REPL" },
            ["<F3>"] = { _cmd("DapToggleBreakpoint"), "Debugger | Toggle breakpoint" },
            ["<F4>"] = {
                function()
                    require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
                end,
                "Debugger | Toggle conditional breakpoint",
            },
            ["<F5>"] = { _cmd("DapContinue"), "Debugger | Start/Continue debugging" },
            ["<F10>"] = { _cmd("DapStepOver"), "Debugger | Step over" },
            ["<F11>"] = { _cmd("DapStepInto"), "Debugger | Step into" },
            ["<F12>"] = { _cmd("DapStepOut"), "Debugger | Step out" },
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
            ["<Esc>"] = { "<C-\\><C-n>" .. _cmd("ToggleTerm"), "Hide terminal" },
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
            e = {
                name = "Explorer",
                e = { _cmd("NvimTreeToggle"), "Toggle Explorer" },
                f = { _cmd("NvimTreeFindFile"), "Find current file in Explorer" },
                c = { _cmd("NvimTreeCollapse"), "Collapse tree" },
            },
            f = {
                name = "Telescope",
                f = { _cmd("Telescope find_files"), "Find files" },
                t = { _cmd("Telescope live_grep"), "Find file with matching text" },
                s = { _cmd("Telescope grep_string"), "Find string in current working directory" },

                b = { _cmd("Telescope buffers"), "Find buffer" },
                c = { _cmd("Telescope command_history"), "Find command in history" },
                h = { _cmd("Telescope search_history"), "Find search history" },
                k = { _cmd("Telescope keymaps"), "Find (normal mode) keymaps" },
                v = { _cmd("Telescope treesitter"), "Find (treesitter) variables" },
            },
            g = {
                name = "Git",
                s = { _cmd("Telescope git_status"), "Git status" },
                S = { _cmd("Telescope git_stash"), "Git stash" },
                b = { _cmd("Telescope git_branches"), "Git branches" },
                c = { _cmd("Telescope git_commits"), "Git commits" },
                f = { _cmd("Telescope git_bcommits"), "Git buffer commits" },
                B = { _cmd("Gitsigns toggle_current_line_blame"), "Toggle current line blame" },
                d = { _cmd("Gitsigns toggle_deleted"), "Toggle deleted" },
                w = { _cmd("Gitsigns toggle_word_diff"), "Toggle word diff" },
                n = { _cmd("Gitsigns next_hunk"), "Next hunk" },
                p = { _cmd("Gitsigns prev_hunk"), "Previous hunk" },
            },
            -- Use space to Hop around in the buffer
            ["<leader>"] = { _cmd("HopWord"), "Hop to any word in buffer" },
            ["1"] = { _cmd("HopChar1"), "Hop with 1 char" },
            l = {
                name = "LSP functions",
                d = { _cmd("Telescope lsp_definitions"), "Goto definition" },
                D = { _cmd("Telescope diagnostics"), "Show diagnostics" },
                i = { _cmd("Telescope lsp_incoming_calls"), "Show incoming calls" },
                I = { _cmd("Telescope lsp_implementations"), "Goto implementation" },
                o = { _cmd("Telescope lsp_outgoing_calls"), "Show outgoing calls" },
                t = { _cmd("Telescope lsp_type_definitions"), "Goto type definition" },
                r = { _cmd("Telescope lsp_references"), "Show references" },
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
                s = { _cmd("Neotest summary"), "Toggle test summary" },
                o = { _cmd("Neotest output"), "Toggle test output" },
            },
            p = {
                name = "Plugins",
                p = { _cmd("Lazy"), "Open Lazy" },
                m = { _cmd("Mason"), "Open Mason" },
                t = {
                    name = "Treesitter",
                    i = { _cmd("TSInstallInfo"), "Install treesitter info" },
                    c = { _cmd("TSConfigInfo"), "Show treesitter config" },
                },
                l = {
                    name = "LSP",
                    i = { _cmd("LspInfo"), "Show LSP info" },
                    l = { _cmd("LspLog"), "Show LSP log" },
                },
                c = {
                    name = "Copilot",
                    s = { _cmd("Copilot status"), "Show Copilot status" },
                    t = { _cmd("Copilot toggle"), "Toggle Copilot" },
                    p = { _cmd("Copilot panel"), "Open panel suggestions" },
                },
                n = {
                    name = "NullLs",
                    i = { _cmd("NullLsInfo"), "Show NullLs info" },
                    l = { _cmd("NullLsLog"), "Show NullLs log" },
                },
            },
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
            x = {
                name = "Sniprun",
                x = { _cmd("SnipRun"), "Execute Snippet" },
                r = { _cmd("SnipReset"), "Sniprun Reset" },
                c = { _cmd("SnipReplMemoryClean"), "Sniprun Memory Clean" },
                l = { _cmd("SnipLive"), "Sniprun live mode toggle" },
                i = { _cmd("SnipInfo"), "Sniprun Info" },
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
            x = { _excmd("SnipRun"), "Execute Snippet" },
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
