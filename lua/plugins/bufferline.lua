return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
    opts = {
        options = {
            mode = "buffers",
            themable = true,
            numbers = "ordinal",
            diagnostics = "nvim_lsp",
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    separator = true,
                },
            },
            color_icons = true,
            show_buffer_icons = true,
            show_buffer_close_icons = true,
            show_duplicate_prefix = true,
            separator_style = "slant",
            always_show_bufferline = false,
        },
    },
}
