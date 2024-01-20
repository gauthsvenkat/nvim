return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        theme = "hyper",
        config = {
            week_header = {
                enable = true,
            },
            shortcut = {
                { desc = "󰊳 Lazy", group = "@property", action = "Lazy", key = "l" },
                { desc = "󰊳 Mason", group = "@property", action = "Mason", key = "m" },
                {
                    icon = " ",
                    icon_hl = "@variable",
                    desc = "Files",
                    group = "Label",
                    action = "Telescope find_files",
                    key = "f",
                },
            },
        },
    },
}
