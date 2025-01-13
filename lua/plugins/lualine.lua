return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "arkav/lualine-lsp-progress",
  },
  opts = {
    sections = {
      lualine_c = { "lsp_progress" },
      lualine_x = {},
      lualine_y = { "buffers" },
    },
  },
}
