-- All LSP related garbage go here.

-- TODO: Undo everything on LSP detach

-- Autocommand to register LSP keybinds with whichkey
-- and telescope. This itself contains another autocommand
-- to highlight references on cursorhold events.
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

    bind_if(
      "textDocument/formatting",
      "<leader>lf",
      vim.lsp.buf.format,
      "[f]ormat",
      client.supports_method("textDocument/rangeFormatting") and { "n", "v" } or "n"
    )

    bind_if("textDocument/hover", "<leader>lh", vim.lsp.buf.hover, "[h]over")
    bind_if("callHierarchy/incomingCalls", "<leader>li", telescope.lsp_incoming_calls, "[i]ncoming calls")
    bind_if("callHierarchy/outgoingCalls", "<leader>lo", telescope.lsp_outgoing_calls, "[o]utgoing calls")
    bind_if("textDocument/rename", "<leader>lr", vim.lsp.buf.rename, "[r]ename")
    bind_if("textDocument/documentSymbol", "<leader>ls", telescope.lsp_document_symbols, "document [s]ymbols")

    -- Keybind to toggle live references highlight. Works by creating and removing autocommands
    -- on CursorHold and CursorMoved events.
    bind_if("textDocument/documentHightlight", "<leader>lt", function()
      local augroup_name = "LSPReferenceHighlight"
      -- Do a protected call to check if the augroup exists. If it does, we
      -- get a bunch of tables. Otherwise it throw an error which we promptly
      -- ignore with the pcall.
      local enabled, _ = pcall(vim.api.nvim_get_autocmds, { group = augroup_name })

      if not enabled then
        local group = vim.api.nvim_create_augroup(augroup_name, {})

        vim.api.nvim_create_autocmd({ "CursorHold", "CursorholdI" }, {
          group = group,
          buffer = args.buf,
          callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
          group = group,
          buffer = args.buf,
          callback = vim.lsp.buf.clear_references,
        })
      else
        vim.api.nvim_del_augroup_by_name(augroup_name)
        vim.lsp.buf.clear_references()
      end
    end, "highligh[t] references")

    bind_if("textDocument/inlayHint", "<leader>ly", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buffer }))
    end, "inla[y] hints")

    bind_if("textDocument/references", "gr", telescope.lsp_references, "Goto or show references")
    bind_if("textDocument/definition", "gd", telescope.lsp_definitions, "Goto or show definition")
  end,
})

return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    -- Which key and telescope are not strictly
    -- required for this, but they are used to
    -- setup keybinds for LSPs.
    "folke/which-key.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    ensure_installed = {
      "lua_ls",
      "basedpyright",
      "nil_ls",
    },
    handlers = {
      -- NOTE: Default handler is disabled since
      -- some linter can also be run as LSPs
      -- which will cause multiple LSPs with
      -- overlapping functionality. Eg. basedpyright
      -- and ruff.
      -- function(server_name)
      --   require("lspconfig")[server_name].setup({})
      -- end,

      ["basedpyright"] = function()
        require("lspconfig").basedpyright.setup({
          basedpyright = {
            analysis = {
              typeCheckingMode = "off",
              diagnosticSeverityOverrides = {
                reportUnusedImport = "unused",
                reportUnusedClass = "unused",
                reportUnusedFunction = "unused",
                reportUnusedVariable = "unused",
                reportUnusedParameter = "unused",
              },
            },
          },
        })
      end,
      ["lua_ls"] = function()
        require("lspconfig").lua_ls.setup({})
      end,
      ["nil_ls"] = function()
        require("lspconfig").nil_ls.setup({
          settings = {
            ["nil"] = {
              formatting = {
                -- NOTE: nixfmt is expected to be installed (not through mason)
                command = { "nixfmt" },
              },
            },
          },
        })
      end,
    },
  },
}
