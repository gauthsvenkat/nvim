return {
  "numToStr/Comment.nvim",
  opts = {
    -- Operator pending mappings
    opleader = {
      line = "<leader>/",
      block = "<leader>?",
    },
    -- Line mappings
    toggler = {
      line = "<leader>//",
      block = "<leader>/?",
    },
    mappings = {
      -- Comment.nvim has a couple of extra
      -- mappings which I don't care much about.
      extra = false,
    },
  },
  keys = {
    { "<leader>/", mode = { "n", "v" } },
    { "<leader>?", mode = { "n", "v" } },
  },
}
