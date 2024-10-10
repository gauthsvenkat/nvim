return {
  "stevearc/conform.nvim",
  dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  event = { "BufWritePre" },
  -- TODO: Toggle format on save
  opts = {
    -- NOTE: These tools are supposed to be
    -- installed already. Check mason.lua.
    formatters_by_ft = {
      lua = { "stylua" },
      python = { --[[ "ruff_fix", ]]
        "ruff_format",
        "ruff_organize_imports",
      },
    },
  },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>bf",
      function()
        require("conform").format({ async = true })
      end,
      mode = { "n", "v" },
      desc = "[f]ormat",
    },
  },
}
