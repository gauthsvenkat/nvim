return {
    "kiyoon/jupynium.nvim",
    build = "python3 -m venv .venv && .venv/bin/pip install .",
    dependencies = {
        "rcarriga/nvim-notify",
        "stevearc/dressing.nvim",
    },
    config = function()
        -- helper function to get the path of an executable if it exists
        local get_if_exists = function(executable)
            return (vim.fn.executable(executable) == 1) and executable or nil
        end
        -- Get the python3 bin with jupynium module installed
        -- This should be available after the buld step
        local python_host = get_if_exists(vim.fn.stdpath("data") .. "/lazy/jupynium.nvim/.venv/bin/python")

        -- The other thing that we need is jupyter binary of the environment we're working in
        local jupyter = get_if_exists(".venv/bin/jupyter")

        -- if both are available, setup jupynium
        if not (python_host and jupyter) then
            print("Either python host or jupyter is not available. Not setting up Jupynium")
            return
        end

        require("jupynium").setup({
            python_host = python_host,
            jupyter_command = jupyter,
        })
    end,
}
