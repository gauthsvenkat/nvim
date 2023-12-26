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
        live_mode_toggle = "enable", -- enables the functionality not the mode
        live_display = { "VirtualTextOk" },
    },
    config = function(_, opts)
        require("sniprun").setup(opts)
    end,
}
