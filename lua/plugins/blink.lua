return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  dependencies = {
    "rafamadriz/friendly-snippets",
    {
      "giuxtaposition/blink-cmp-copilot",
      dependencies = {
        "zbirenbaum/copilot.lua",
        build = ":Copilot auth",
        opts = { suggestion = { enabled = false }, panel = { enabled = false } },
      },
    },
  },
  version = "*",
  opts = {
    keymap = { preset = "default" },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    -- NOTE: Following section copied from lazyvim.
    completion = {
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        draw = {
          treesitter = { "lsp" },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      ghost_text = {
        enabled = false,
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "copilot" },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-cmp-copilot",
          score_offset = 100,
          async = true,
        },
      },
    },
  },
  opts_extend = { "sources.default" },
}
