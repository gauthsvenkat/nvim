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
      is_always_hidden = function(name, _)
        return name == ".."
      end,
    },
    use_default_keymaps = false,
    keymaps = {
      ["<C-h>"] = "actions.parent",
      ["<C-l>"] = "actions.select",
      ["<C-.>"] = "actions.toggle_hidden",
      ["<Bs>"] = "actions.close",
    },
  },
  keys = {
    { "<Bs>", cmd("Oil --float"), desc = "Open Oil" },
  },
}
