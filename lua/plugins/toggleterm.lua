local u = require("utils")

return {
    "akinsho/toggleterm.nvim",
    opts = {},
    init = function()
        u.register_group_with_whichkey("<leader>\\", "Terminal")
    end,
    config = function(_, opts)
        require("toggleterm").setup(opts)

        -- Create some terminal that can be bound to keys
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

        -- Register the keybinds
        vim.keymap.set("n", "<leader>\\\\", function()
            terminal:toggle()
        end, { desc = "Floating terminal" })
        -- Need this in case we want to keep the terminal open in the background
        vim.keymap.set("t", "<C-\\>\\", function()
            terminal:toggle()
        end)
        vim.keymap.set("n", "<leader>\\p", function()
            python_terminal:toggle()
        end, { desc = "Python REPL" })
        vim.keymap.set("n", "<leader>\\g", function()
            lazygit_terminal:toggle()
        end, { desc = "Lazygit" })
    end,
    keys = "<leader>\\",
}
