local cmd = require("utils").cmd

return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  opts = {
    exclude = {
      filetypes = {
        "lspinfo",
        "dashboard",
        "checkhealth",
        "help",
        "man",
        "gitcommit",
        "TelescopePrompt",
        "TelescopeResults",
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
