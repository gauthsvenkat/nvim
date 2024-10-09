local cmd = require("utils").cmd

return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    win_options = {
      wrap = true,
    },
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        return name == ".."
      end,
    },
    keymaps = {
      ["<BS>"] = "actions.parent",
      ["<Esc>"] = "actions.close",
    },
  },
  keys = {
    { "<BS>", cmd("Oil --float"), desc = "Open parent directory" },
  },
}
