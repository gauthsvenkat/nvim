return {
    "kylechui/nvim-surround",
    opts = {
        keymaps = {
            normal = "s",
            normal_line = "S",
            visual = "s",
            visual_line = "S",
        },
    },
    keys = { { "s", mode = { "n", "v" } }, { "S", mode = { "n", "v" } }, { "ds" } },
}
