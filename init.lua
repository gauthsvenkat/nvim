-- NOTE: Make sure the following external dependencies are installed
-- - ripgrep (telescope)
-- - fd (telescope)
-- - nodejs (not sure but shit breaks if not there, copilot)
-- - python3 (lsp (mason))
-- - unzip (mason)
-- - gcc, make, cmake (a bunch of stuff)
require("config.options")
require("config.lazy")

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", {}),
  desc = "Hightlight selection on yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- Neovide
if vim.g.neovide then
  vim.g.neovide_scale_factor = (vim.loop.os_uname().sysname == "Darwin") and 1.3 or 0.9

  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end

  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.15)
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.15)
  end)
end
