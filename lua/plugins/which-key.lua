local u = require("utils")

return {
    "folke/which-key.nvim",
    init = function()
        -- make sure space isn't assigned to anything
        vim.keymap.set("", "<space>", "<nop>")
    end,
    opts = {},
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)

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

            ["<leader>h"] = { u._excmd("noh"), "Disable search highlight" },
            ["<leader>p"] = {
                name = "Plugins",
                p = { u._cmd("Lazy"), "Open Lazy" },
            },
            ["<leader>q"] = {
                name = "Quit",
                b = { u._excmd("bd"), "Close buffer" },
                B = { u._excmd("bd!"), "Close buffer without saving" },
                q = { u._excmd("q"), "Quit" },
                Q = { u._excmd("qa"), "Quit all" },
            },
            ["<leader>r"] = { ":%s///gc" .. string.rep("<Left>", 4), "Start search and replace" },
            ["<leader>R"] = { ":%s/\\<<C-r><C-w>\\>//g<Left><Left>", "Search and replace word under cursor" },
            ["<leader>w"] = {
                name = "Write",
                w = { u._excmd("w"), "Write" },
                a = { u._excmd("w"), "Write all" },
            },
        })
    end,
}
