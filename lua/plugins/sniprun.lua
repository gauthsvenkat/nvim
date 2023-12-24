return {
    "michaelb/sniprun",
    build = "sh install.sh",
    opts = {
        -- python3 fifo requires that we run SnipRun once
        selected_interpreters = { "Python3_fifo" },
        repl_enable = { "Python3_fifo" },
    },
    config = function(_, opts)
        require("sniprun").setup(opts)
    end,
}
