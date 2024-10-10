-- All LSP related garbage go here.

-- TODO: Remove keybinds on LSP detach

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
    ---@param mode? string | string[]
    local function bind_if(method, keys, callback, desc, mode)
      if client.supports_method(method) then
        wk.add({ keys, callback, desc = desc, buffer = buffer, mode = mode or "n" })
      end
    end

    bind_if("textDocument/codeAction", "<leader>la", vim.lsp.buf.code_action, "code [a]ction")
    bind_if("textDocument/rename", "<leader>lr", vim.lsp.buf.rename, "[r]ename")
    bind_if(
      "textDocument/formatting",
      "<leader>lf",
      vim.lsp.buf.format,
      "[f]ormat",
      client.supports_method("textDocument/rangeFormatting") and { "n", "v" } or "n"
    )

    bind_if("callHierarchy/incomingCalls", "<leader>li", telescope.lsp_incoming_calls, "[i]ncoming calls")
    bind_if("callHierarchy/outgoingCalls", "<leader>lo", telescope.lsp_outgoing_calls, "[o]utgoing calls")
    bind_if("textDocument/documentSymbol", "<leader>ls", telescope.lsp_document_symbols, "document [s]ymbols")
    bind_if("textDocument/references", "gr", telescope.lsp_references, "Goto or show references")
    bind_if("textDocument/definition", "gd", telescope.lsp_definitions, "Goto or show definition")
    bind_if("textDocument/inlayHint", "<leader>lh", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buffer }))
    end, "inlay [h]ints")

    -- TODO: Highlight references on curserhold
  end,
})

return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
    -- Which key and telescope are not strictly
    -- required for this, but they are used to
    -- setup keybinds for LSPs.
    "folke/which-key.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    handlers = {
      -- NOTE: Default handler is disabled since
      -- some linter can also be run as LSPs
      -- which will cause multiple LSPs with
      -- overlapping functionality. Eg. basedpyright
      -- and ruff.
      -- function(server_name)
      --   require("lspconfig")[server_name].setup({})
      -- end,

      -- NOTE: These LSPs are required to be installed
      -- already. Check mason.lua
      ["basedpyright"] = function()
        require("lspconfig").basedpyright.setup({})
      end,
      ["lua_ls"] = function()
        require("lspconfig").lua_ls.setup({})
      end,
    },
  },
}
