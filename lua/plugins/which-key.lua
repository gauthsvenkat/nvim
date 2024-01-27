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
            -- easier buffer navigation
            ["<C-b>"] = { u._cmd("bprevious"), "Move to previous buffer" },
            ["<C-n>"] = { u._cmd("bnext"), "Move to next buffer" },
            ["<C-x>"] = { u._cmd("bdelete"), "Delete buffer" },
            -- resize window pane with arrows
            ["<C-Up>"] = { u._excmd("resize +2"), "Increase window height" },
            ["<C-Down>"] = { u._excmd("resize -2"), "Decrease window height" },
            ["<C-Left>"] = { u._excmd("vertical resize -2"), "Decrease window width" },
            ["<C-Right>"] = { u._excmd("vertical resize +2"), "Increase window width" },
        }, {
            mode = "n",
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

                c = {
                    name = "Copilot",
                    s = { u._cmd("Copilot status"), "Show Copilot status" },
                    t = { u._cmd("Copilot toggle"), "Toggle Copilot" },
                    p = { u._cmd("Copilot panel"), "Open panel suggestions" },
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
