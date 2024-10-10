return {
  "mfussenegger/nvim-lint",
  dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- NOTE: These tools are supposed to be
    -- intalled already. Check mason.lua.
    lint.linters_by_ft = {
      python = { "ruff", "mypy" },
    }

    -- TODO: Keymap to toggle linting.

    -- Create an autocommand to run lint on certain events
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = vim.api.nvim_create_augroup("lint", { clear = true }),
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
