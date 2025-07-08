return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    -- to ensure lsps are installed
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- for the sweet statuses
    { "j-hui/fidget.nvim", opts = {} },
    -- to setup keybinds
    "ibhagwan/fzf-lua",
    -- to register capabilities
    "saghen/blink.cmp",
  },
  config = function()
    -- start custom-lsp-attach autocommand
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("custom-lsp-attach", { clear = true }),

      -- start custom-lsp-attach callback
      callback = function(aevent)
        local client = vim.lsp.get_client_by_id(aevent.data.client_id)
        local fzf = require("fzf-lua")

        ---@param method string
        ---@param keys string
        ---@param fn function
        ---@param desc string
        ---@param mode? string | string[]
        local function map_if(method, keys, fn, desc, mode)
          if client and client:supports_method(method, aevent.buf) then
            vim.keymap.set(mode or "n", keys, fn, { buffer = aevent.buf, desc = desc })
          end
        end

        -- start of keymapping block
        map_if("textDocument/references", "gr", fzf.lsp_references, "[r]eferences")
        map_if("textDocument/definition", "gd", fzf.lsp_definitions, "[d]efinitions")
        map_if("textDocument/declaration", "gD", fzf.lsp_declarations, "[D]eclarations")
        map_if("textDocument/typeDefinition", "gt", fzf.lsp_typedefs, "[t]ype definitions")
        map_if("textDocument/implementation", "gI", fzf.lsp_implementations, "[I]mplementations")

        map_if("callHierarchy/incomingCalls", "gi", fzf.lsp_incoming_calls, "[i]ncoming calls")
        map_if("callHierarchy/outgoingCalls", "go", fzf.lsp_outgoing_calls, "[o]utgoing calls")

        map_if("textDocument/documentSymbol", "<leader>ls", fzf.lsp_document_symbols, "[s]ymbols")
        map_if("textDocument/hover", "<leader>lh", vim.lsp.buf.hover, "[h]over documentation")
        map_if("workspace/symbol", "<leader>lS", fzf.lsp_workspace_symbols, "(workspace) [S]ymbols")
        map_if("textDocument/rename", "<leader>lr", vim.lsp.buf.rename, "[r]ename")
        map_if("textDocument/codeAction", "<leader>la", vim.lsp.buf.code_action, "code [a]ction")
        map_if(
          "textDocument/formatting",
          "<leader>lf",
          vim.lsp.buf.format,
          "[f]ormat",
          client and client:supports_method("textDocument/rangeFormatting", aevent.buf) and { "n", "v" } or "n"
        )
        -- end of keymapping block

        -- NOTE: Not gonna bother unbinding the keymaps when LspDetach.
      end,
      -- end custom-lsp-attach callback
    })
    -- end custom-lsp-attach autocommand

    -- start of lsp setup
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    local servers = {
      nil_ls = {
        settings = { nix = { flake = { autoArchive = true } } },
      },
    }

    require("mason-lspconfig").setup({
      automatic_enable = true,
      -- NOTE: Following set to empty so mason-tool-installer will take care of it
      ensure_installed = {},
      automatic_installation = false,
      handlers = {
        function(server_name)
          local server_opts = servers[server_name] or {}
          server_opts.capabilities = vim.tbl_deep_extend("force", capabilities, server_opts.capabilities or {})

          require("lspconfig")[server_name].setup(server_opts)
        end,
      },
    })
    -- end of lsp setup
  end,
}
