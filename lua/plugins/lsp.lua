-- All LSP related garbage go here.

-- Autocommand to register LSP keybinds
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local buffer = args.buf
    local wk = require("which-key")
    local telescope = require("telescope.builtin")

    ---@param method string
    ---@param keys string
    ---@param callback function
    ---@param desc string
    local function bind_if(method, keys, callback, desc, mode)
      if client.supports_method(method) then
        wk.add({ keys, callback, desc = desc, buffer = buffer, mode = mode or "n" })
      end
    end

    bind_if("textDocument/codeAction", "<leader>la", vim.lsp.buf.code_action, "Code action")
    bind_if("textDocument/rename", "<leader>lc", vim.lsp.buf.rename, "Change name")
    bind_if(
      "textDocument/formatting",
      "<leader>lf",
      vim.lsp.buf.format,
      "Format (range)",
      client.supports_method("textDocument/rangeFormatting") and { "n", "v" } or "n"
    )

    bind_if("callHierarchy/incomingCalls", "<leader>li", telescope.lsp_incoming_calls, "Incoming calls")
    bind_if("callHierarchy/outgoingCalls", "<leader>lo", telescope.lsp_outgoing_calls, "Outgoing calls")
    bind_if("textDocument/documentSymbol", "<leader>ls", telescope.lsp_document_symbols, "Show document symbols")
    bind_if("textDocument/references", "gr", telescope.lsp_references, "Goto or show references")
    bind_if("textDocument/definition", "gd", telescope.lsp_definitions, "Goto or show definition")
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
