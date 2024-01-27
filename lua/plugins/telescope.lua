local u = require("utils")

return {
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build =
        "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
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
            { "<leader>ff", u._cmd("Telescope find_files"),           desc = "Files" },
            { "<leader>ft", u._cmd("Telescope live_grep"),            desc = "File with matching text" },
            { "<leader>fs", u._cmd("Telescope grep_string"),          desc = "String in current working directory" },
            { "<leader>fb", u._cmd("Telescope buffers"),              desc = "Buffer" },
            { "<leader>fc", u._cmd("Telescope command_history"),      desc = "Command in history" },
            { "<leader>fh", u._cmd("Telescope search_history"),       desc = "Search history" },
            { "<leader>fk", u._cmd("Telescope keymaps"),              desc = "(normal mode) keymaps" },
            { "<leader>fv", u._cmd("Telescope treesitter"),           desc = "(treesitter) variables" },
            { "<leader>gs", u._cmd("Telescope git_status"),           desc = "Git status" },
            { "<leader>gS", u._cmd("Telescope git_stash"),            desc = "Git stash" },
            { "<leader>gb", u._cmd("Telescope git_branches"),         desc = "Git branches" },
            { "<leader>gc", u._cmd("Telescope git_commits"),          desc = "Git commits" },
            { "<leader>ld", u._cmd("Telescope lsp_definitions"),      desc = "Definition of symbol under cursor" },
            { "<leader>lD", u._cmd("Telescope diagnostics"),          desc = "Diagnostics" },
            { "<leader>li", u._cmd("Telescope lsp_incoming_calls"),   desc = "Incoming calls" },
            { "<leader>lI", u._cmd("Telescope lsp_implementations"),  desc = "Implementation of symbol under cursor" },
            { "<leader>lo", u._cmd("Telescope lsp_outgoing_calls"),   desc = "Outgoing calls" },
            { "<leader>lt", u._cmd("Telescope lsp_type_definitions"), desc = "Type definition of symbol under cursor" },
            { "<leader>lr", u._cmd("Telescope lsp_references"),       desc = "References" },
        },
    },
}
