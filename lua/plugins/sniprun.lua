return {
  "michaelb/sniprun",
  branch = "master",
  build = "sh install.sh",
  opts = {
    display = { "TerminalWithCode", "VirtualTextOk" },
  },
  keys = {
    {
      "<leader>rc",
      "<Plug>SnipReplMemoryClean",
      desc = "Repl memory [c]lean",
    },
    {
      "<leader>ri",
      "<Plug>SnipInfo",
      desc = "[i]nfo",
    },
    {
      "<leader>rl",
      "<Plug>SnipLive",
      desc = "[l]ive mode",
    },
    {
      "<leader>rr",
      "<Plug>SnipRun",
      desc = "[r]un snippet",
      mode = { "n", "v" },
    },
    {
      "<leader>rR",
      "<Plug>SnipReset",
      desc = "[R]eset",
    },
  },
}
