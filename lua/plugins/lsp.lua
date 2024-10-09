-- All LSP related garbage go here.

-- Autocommand to register LSP keybinds
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local wk = require("which-key")
    local telescope = require("telescope.builtin")

    if client.supports_method("textDocument/codeAction") then
      wk.add({ "<leader>la", vim.lsp.buf.code_action, desc = "Code action", buffer = args.buf })
    end

    if client.supports_method("textDocument/rename") then
      wk.add({ "<leader>lc", vim.lsp.buf.rename, desc = "Change name", buffer = args.buf })
    end

    if client.supports_method("textDocument/formatting") then
      wk.add({
        "<leader>lf",
        vim.lsp.buf.format,
        desc = "Format (range)",
        buffer = args.buf,
        mode = client.supports_method("textDocument/rangeFormatting") and { "n", "v" } or "n",
      })
    end

    if client.supports_method("callHierarchy/incomingCalls") then
      wk.add({ "<leader>li", telescope.lsp_incoming_calls, desc = "Incoming calls", buffer = args.buf })
    end

    if client.supports_method("callHierarchy/outgoingCalls") then
      wk.add({ "<leader>lo", telescope.lsp_outgoing_calls, desc = "Outgoing calls", buffer = args.buf })
    end

    if client.supports_method("textDocument/documentSymbol") then
      wk.add({ "<leader>ls", telescope.lsp_document_symbols, desc = "Show document symbols", buffer = args.buf })
    end

    if client.supports_method("textDocument/references") then
      wk.add({ "gr", telescope.lsp_references, desc = "Goto or show references", buffer = args.buf })
    end

    if client.supports_method("textDocument/definition") then
      wk.add({ "gd", telescope.lsp_definitions, desc = "Goto or show definition", buffer = args.buf })
    end
  end,
})

return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
    -- Which key and telescope are not strictly
    -- required for this, but they are used to
    "folke/which-key.nvim",
    "nvim-telescope/telescope.nvim",
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
