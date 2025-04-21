return {
  {
    "catppuccin/nvim",
    cond = not vim.g.vscode,
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      dim_inactive = { enabled = true, percentage = 0.10 },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
  {
    "navarasu/onedark.nvim",
    cond = not vim.g.vscode,
    priority = 1000,
    enabled = false,
    opts = {
      style = "darker",
    },
    config = function(_, opts)
      require("onedark").setup(opts)
      vim.cmd([[colorscheme onedark]])
    end,
  },
}
