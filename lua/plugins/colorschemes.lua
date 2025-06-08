return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "mocha",
    dim_inactive = { enabled = true, percentage = 0.10 },
    color_overrides = { mocha = { base = "#000000", mantle = "#000000", crust = "#000000" } },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd([[colorscheme catppuccin]])
  end,
}
