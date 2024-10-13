return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
      -- Parsers that should always be installed
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
      -- Auto install missing parsers when entering a buffer
      auto_install = true,

      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = false,
          node_incremental = ";",
          node_decremental = ",",
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    main = "nvim-treesitter.configs",
    opts = {
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["aa"] = { query = "@parameter.outer", desc = "[a]rgument" },
            ["ia"] = { query = "@parameter.inner", desc = "[a]rgument" },

            ["ac"] = { query = "@class.outer", desc = "[c]lass" },
            ["ic"] = { query = "@class.inner", desc = "[c]lass" },

            ["af"] = { query = "@function.outer", desc = "[f]unction" },
            ["if"] = { query = "@function.inner", desc = "[f]unction" },

            ["ai"] = { query = "@conditional.outer", desc = "[i]f" },
            ["ii"] = { query = "@conditional.inner", desc = "[i]f" },

            ["al"] = { query = "@loop.outer", desc = "[l]oop" },
            ["il"] = { query = "@loop.inner", desc = "[l]oop" },
          },
        },
        swap = {
          -- TODO:
          enable = false,
          keymaps = {
            -- ["<leader>wa"] = { query = "@parameter.inner", desc = "[a]rgument" },
          },
        },
        move = {
          -- TODO:
          enable = false,
        },
      },
    },
  },
}
