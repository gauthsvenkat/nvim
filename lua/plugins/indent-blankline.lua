local cmd = require("utils").cmd

return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  opts = {
    exclude = {
      filetypes = {
        "lspinfo",
        "checkhealth",
        "help",
        "man",
        "gitcommit",
        "TelescopePrompt",
        "TelescopeResults",
        "dashboard",
        "",
      },
    },
  },
  main = "ibl",
  keys = {
    { "<leader>ii", cmd("IBLToggle"), desc = "Indent Blankline toggle" },
    { "<leader>is", cmd("IBLToggleScope"), desc = "Indent Blankline scope toggle" },
  },
}
