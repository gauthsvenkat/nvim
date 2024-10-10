local cmd = require("utils").cmd

return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {},
    keys = {
      { "<leader>pm", cmd("Mason"), desc = "Mason" },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        -- Language servers
        "lua_ls",
        "basedpyright",
        -- linters
        "ruff", -- Also an LSP and formatter
        "mypy",
        -- Formatters
        "stylua",
      },
    },
  },
}
