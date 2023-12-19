return {
    {
        "kiyoon/jupynium.nvim",
        dependencies = {
            "rcarriga/nvim-notify",
        },
        build = "python3 -m venv .venv && .venv/bin/python -m pip install .",
        config = function()
            local jupynium_binary_dir = vim.fn.stdpath("data") .. "/lazy/jupynium.nvim/.venv/bin/"
            require("jupynium").setup({
                python_host = jupynium_binary_dir .. "python",
                jupyter_command = jupynium_binary_dir .. "jupyter",
            })
        end,
    },
}
