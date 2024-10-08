return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {
    -- We can pass in handlers to automagically
    -- setup lsp servers installed through mason.
    -- First entry is the default handler, and
    -- subsequent ["server_name"] = function() ... end
    -- will count as dedicated handlers.
    handlers = {
      function(server_name)
        require("lspconfig")[server_name].setup({})
      end,
    },
  },
}
