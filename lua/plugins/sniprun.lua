return {
    "michaelb/sniprun",
    build = "sh install.sh",
    opts = {
        -- use Python3 as default interpreter (instead of Python3_original)
        selected_interpreters = { "Python3_fifo" },
        repl_enable = { "Python3_fifo" },
        display = {
            -- "VirtualTextOk",
            "TerminalWithCode",
            "LongTempFloatingWindow",
        },
        live_mode_toggle = "off",
        live_display = { "VirtualTextOk" },
    },
    config = function(_, opts)
        require("sniprun").setup(opts)
        vim.keymap.set("n", "<leader>xx", require("sniprun").run, { desc = "Execute Snippet" })

        vim.keymap.set("v", "<leader>xx", function()
            require("sniprun").run("v")
        end, { desc = "Execute Snippet" })

        vim.keymap.set("n", "<leader>xi", require("sniprun").info, { desc = "Sniprun Info" })
        vim.keymap.set("n", "<leader>xr", require("sniprun").reset, { desc = "Sniprun Reset" })
        vim.keymap.set("n", "<leader>xc", require("sniprun").clear_repl, { desc = "Sniprun Memory Clean" })
        vim.keymap.set("n", "<leader>xl", require("sniprun.live_mode").toggle, { desc = "Sniprun live mode toggle" })
    end,
}
