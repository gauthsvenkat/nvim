return {
  "MeanderingProgrammer/render-markdown.nvim",
  cond = not vim.g.vscode,
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  opts = {},
  ft = "markdown",
  cmd = "RenderMarkdown",
}
