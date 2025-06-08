return {
  "stevearc/conform.nvim",
  dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  event = { "BufWritePre" },
  opts = {
    -- NOTE: Ensure formatters are installed by adding them to mason.lua
    formatters_by_ft = {
      lua = { "stylua" },
      python = {
        "ruff_format",
        "ruff_organize_imports",
      },
      rust = { "rustfmt" },
      nix = { "alejandra" },
    },
    -- TODO: Format on save. See https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#command-to-toggle-format-on-save
    -- Might be worth figuring out snacks toggle before tackling the above
    format_on_save = { lsp_format = "fallback" },
  },
  cmd = { "ConformInfo" },
}
