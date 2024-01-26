return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-tree/nvim-web-devicons" },
    opts = {
        theme = "hyper",
        change_to_vcs_root = true,
        config = {
            week_header = {
                enable = true,
            },
            shortcut = {
                { desc = "Lazy", group = "@property", action = "Lazy", key = "l" },
                { desc = "Mason", group = "@property", action = "Mason", key = "m" },
                {
                    icon_hl = "@variable",
                    desc = "Find files",
                    group = "Label",
                    action = "Telescope find_files",
                    key = "f",
                },
                {
                    icon_hl = "@variable",
                    desc = "Text grep",
                    group = "Label",
                    action = "Telescope live_grep",
                    key = "t",
                },
            },
        },
    },
}
