return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      dim_inactive = { enabled = true, percentage = 0.10 },
    },
  },
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    opts = {
      style = "darker",
    },
    config = function(_, opts)
      require("onedark").setup(opts)
      vim.cmd([[colorscheme onedark]])
    end,
  },
}
