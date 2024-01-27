local u = require("utils")

return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        },
    },
    init = function()
        u.register_group_with_whichkey("<leader>f", "Find")
    end,
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                mappings = {
                    -- Without this, gotta press <esc> twice to exit
                    i = {
                        ["<esc>"] = require("telescope.actions").close,
                    },
                },
            },
        })
        telescope.load_extension("fzf")
    end,
    keys = {
        { "<leader>ff", u._cmd("Telescope find_files"), desc = "Files" },
        { "<leader>ft", u._cmd("Telescope live_grep"), desc = "File with matching text" },
        { "<leader>fs", u._cmd("Telescope grep_string"), desc = "String in current working directory" },
        { "<leader>fb", u._cmd("Telescope buffers"), desc = "Buffer" },
        { "<leader>fc", u._cmd("Telescope command_history"), desc = "Command in history" },
        { "<leader>fh", u._cmd("Telescope search_history"), desc = "Search history" },
        { "<leader>fk", u._cmd("Telescope keymaps"), desc = "(normal mode) keymaps" },
        { "<leader>fv", u._cmd("Telescope treesitter"), desc = "(treesitter) variables" },
        { "<leader>gs", u._cmd("Telescope git_status"), desc = "Git status" },
        { "<leader>gS", u._cmd("Telescope git_stash"), desc = "Git stash" },
        { "<leader>gb", u._cmd("Telescope git_branches"), desc = "Git branches" },
        { "<leader>gc", u._cmd("Telescope git_commits"), desc = "Git commits" },
    },
}
