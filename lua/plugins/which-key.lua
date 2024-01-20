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
        local exists = function(cmd)
            return vim.fn.executable(cmd) == 1
        end

        -- Some terminal windows that can be bound to keys
        local terminal_factory = require("toggleterm.terminal").Terminal

        local terminal = terminal_factory:new({
            cmd = exists("zsh") and "zsh" or "bash",
            direction = "float",
            hidden = true,
        })

        local python_terminal = terminal_factory:new({
            cmd = (exists(".venv/bin/python") and ".venv/bin/python") or (exists("python3") and "python3") or "python",
            direction = "float",
            hidden = true,
        })

        local lazygit_terminal = terminal_factory:new({
            cmd = "lazygit",
            direction = "float",
            hidden = true,
        })

        -- some normal mode mappings to make life easier
        wk.register({
            -- keep search terms in the middle of the screen
            n = { "nzzzv", "Move to next search term" },
            N = { "Nzzzv", "Move to previous search term" },
            -- easier window navigation
            ["<C-h>"] = { "<C-w>h", "Move to left window" },
            ["<C-j>"] = { "<C-w>j", "Move to down window" },
            ["<C-k>"] = { "<C-w>k", "Move to up window" },
            ["<C-l>"] = { "<C-w>l", "Move to down window" },
            -- keep cursor in middle when jumping through a buffer
            ["<C-d>"] = { "<C-d>zz", "Move down half page" },
            ["<C-u>"] = { "<C-u>zz", "Move up half page" },
            -- easier buffer navigation
            ["<C-n>"] = { "<cmd>bprevious<cr>", "Move to previous buffer" },
            ["<C-m>"] = { "<cmd>bnext<cr>", "Move to next buffer" },
            ["<C-x>"] = { "<cmd>bdelete<cr>", "Delete buffer" },
            -- resize window pane with arrows
            ["<C-Up>"] = { ":resize +2<cr>", "Increase window height" },
            ["<C-Down>"] = { ":resize -2<cr>", "Decrease window height" },
            ["<C-Left>"] = { ":vertical resize -2<cr>", "Decrease window width" },
            ["<C-Right>"] = { ":vertical resize +2<cr>", "Increase window width" },
            -- easier moving line(s) of code
            ["<A-j>"] = { ":m .+1<cr>==", "Move line down" },
            ["<A-k>"] = { ":m .-2<cr>==", "Move line up" },
            -- Dap mappings
            ["<F1>"] = { "<cmd>DapToggleRepl<cr>", "Debugger | Toggle REPL" },
            ["<F3>"] = { "<cmd>DapToggleBreakpoint<cr>", "Debugger | Toggle breakpoint" },
            ["<F4>"] = {
                function()
                    require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
                end,
                "Debugger | Toggle conditional breakpoint",
            },
            ["<F5>"] = { "<cmd>DapContinue<cr>", "Debugger | Start/Continue debugging" },
            ["<F10>"] = { "<cmd>DapStepOver<cr>", "Debugger | Step over" },
            ["<F11>"] = { "<cmd>DapStepInto<cr>", "Debugger | Step into" },
            ["<F12>"] = { "<cmd>DapStepOut<cr>", "Debugger | Step out" },
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
                e = { "<cmd>NvimTreeToggle<cr>", "Toggle Explorer" },
                f = { "<cmd>NvimTreeFindFile<cr>", "Find current file in Explorer" },
                c = { "<cmd>NvimTreeCollapse<cr>", "Collapse tree" },
            },
            f = {
                name = "Telescope",
                f = { "<cmd>Telescope find_files<cr>", "Find files" },
                t = { "<cmd>Telescope live_grep<cr>", "Find file with matching text" },
                s = { "<cmd>Telescope grep_string<cr>", "Find string in current working directory" },

                d = { "<cmd>Telescope diagnostics<cr>", "Find diagnoses" },
                e = { "<cmd>Telescope lsp_definitions<cr>", "Goto or show definitions for current word" },
                r = { "<cmd>Telescope lsp_references<cr>", "Find references for current word" },
                i = { "<cmd>Telescope lsp_implementations<cr>", "Goto or show implementations for current word" },

                b = { "<cmd>Telescope buffers<cr>", "Find buffer" },
                c = { "<cmd>Telescope command_history<cr>", "Find command in history" },
                h = { "<cmd>Telescope search_history<cr>", "Find search history" },
                k = { "<cmd>Telescope keymaps<cr>", "Find (normal mode) keymaps" },
                v = { "<cmd>Telescope treesitter<cr>", "Find (treesitter) variables" },
            },
            -- Use space to Hop around in the buffer
            ["<leader>"] = { "<cmd>HopWord<cr>", "Hop to any word in buffer" },
            l = {
                name = "LSP functions",
                d = { "<cmd>Telescope lsp_definitions<cr>", "Goto definition" },
                D = { "<cmd>Telescope diagnostics<cr>", "Show diagnostics" },
                i = { "<cmd>Telescope lsp_incoming_calls<cr>", "Show incoming calls" },
                I = { "<cmd>Telescope lsp_implementations", "Goto implementation" },
                o = { "<cmd>Telescope lsp_outgoing_calls<cr>", "Show outgoing calls" },
                t = { "<cmd>Telescope lsp_type_definitions<cr>", "Goto type definition" },
                r = { "<cmd>Telescope lsp_references<cr>", "Show references" },
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
                s = { "<cmd>Neotest summary<cr>", "Toggle test summary" },
                o = { "<cmd>Neotest output<cr>", "Toggle test output" },
            },
            p = {
                name = "Plugins",
                p = { "<cmd>Lazy<cr>", "Open Lazy" },
                m = { "<cmd>Mason<cr>", "Open Mason" },
                t = {
                    name = "Treesitter",
                    i = { "<cmd>TSInstallInfo<cr>", "Install treesitter info" },
                    c = { "<cmd>TSConfigInfo<cr>", "Show treesitter config" },
                },
                l = {
                    name = "LSP",
                    i = { "<cmd>LspInfo<cr>", "Show LSP info" },
                    l = { "<cmd>LspLog<cr>", "Show LSP log" },
                },
                c = {
                    name = "Copilot",
                    s = { "<cmd>Copilot status<cr>", "Show Copilot status" },
                    t = { "<cmd>Copilot toggle<cr>", "Toggle Copilot" },
                    p = { "<cmd>Copilot panel<cr>", "Open panel suggestions" },
                },
                n = {
                    name = "NullLs",
                    i = { "<cmd>NullLsInfo<cr>", "Show NullLs info" },
                    l = { "<cmd>NullLsLog<cr>", "Show NullLs log" },
                },
            },
            -- s reserved for treesitter
            S = { require("tsht").nodes, "Start selecting nodes with Hop" },
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
                x = { "<cmd>SnipRun<cr>", "Execute Snippet" },
                r = { "<cmd>SnipReset<cr>", "Sniprun Reset" },
                c = { "<cmd>SnipReplMemoryClean<cr>", "Sniprun Memory Clean" },
                l = { "<cmd>SnipLive<cr>", "Sniprun live mode toggle" },
                i = { "<cmd>SnipInfo<cr>", "Sniprun Info" },
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
            x = { ":SnipRun<cr>", "Execute Snippet" },
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
