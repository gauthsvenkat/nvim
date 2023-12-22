return {
    {
        "kiyoon/jupynium.nvim",
        dependencies = {
            "rcarriga/nvim-notify",
        },
        -- The buld command will create a virtual env and install jupynium somewhere in the nvim data directory
        build = "python3 -m venv .venv && .venv/bin/python -m pip install .",
        -- For jupynium to work, we need 3 things
        -- 1. The python host with jupynium module installed (what we do abobe)
        -- 2. The jupyter command - which needs to be found in some virtual environment
        -- 3. Firefox with geckodriver installed. This should be already be in the PATH
        config = function()
            -- Location to the python host with juypnium installed
            local jupynium_binary_dir = vim.fn.stdpath("data") .. "/lazy/jupynium.nvim/.venv/bin/"

            -- Try to find the jupyter command
            local get_jupyter_path = function()
                local check_jupyter_exists = function(path)
                    return vim.fn.executable(path) == 1
                end

                -- check venv
                local venv_path = os.getenv("VIRTUAL_ENV")
                if venv_path then
                    local full_path = venv_path .. "/bin/jupyter"
                    if check_jupyter_exists(full_path) then
                        return full_path
                    end
                end

                -- check conda
                local venv_path = os.getenv("CONDA_PREFIX")
                if venv_path then
                    local full_path = venv_path .. "/bin/jupyter"
                    if check_jupyter_exists(full_path) then
                        return full_path
                    end
                end

                -- check if jupyter is in PATH
                local jupyter_path = vim.fn.exepath("jupyter")
                if jupyter_path and check_jupyter_exists(jupyter_path) then
                    return jupyter_path
                end

                -- jupyter not found
                return nil
            end

            require("jupynium").setup({
                python_host = jupynium_binary_dir .. "python",
                jupyter_command = get_jupyter_path(),
            })
        end,
    },
}
