return {
  "kylechui/nvim-surround",
  event = "VeryLazy",
  opts = {
    keymaps = {
      -- s -> Same line surround | Enter operator pending mode
      -- ss -> Same line surround | Whole line
      -- S -> Multi line surround | Enter operator pending mode
      -- SS -> Multi line surround | Whole line
      normal = "s",
      normal_cur = "ss",
      normal_line = "S",
      normal_cur_line = "SS",
      visual = "s",
      visual_line = "S",
      delete = "ds",
      change = "cs",
      change_line = "cS",
    },
  },
}
