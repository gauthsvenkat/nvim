return {
    {
        "sainnhe/gruvbox-material",
        init = function()
            vim.o.gruvbox_material_background = "hard"
            vim.cmd.colorscheme("gruvbox-material")
        end,
    },
    { "akinsho/bufferline.nvim", dependencies = "nvim-tree/nvim-web-devicons", config = true },
    { "nvim-lualine/lualine.nvim", dependencies = "nvim-tree/nvim-web-devicons", config = true },
    { "kevinhwang91/nvim-hlslens", opts = { calm_down = true } },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", config = true },
    {
        "folke/noice.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        event = "VeryLazy",
        config = true,
    },
}
