return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    -- Parsers that should always be installed
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
    -- Auto install missing parsers when entering a buffer
    auto_install = true,

    highlight = { enable = true },
    indent = { enable = true },
  },
  main = "nvim-treesitter.configs",
}
