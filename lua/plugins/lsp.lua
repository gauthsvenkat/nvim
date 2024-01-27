local u = require("utils")

return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
        require("mason-lspconfig").setup({
            handlers = {
                -- first entry without a server name is the default handler
                function(server_name)
                    -- if nvim-cmp is available, use it to expose capabilities to the server
                    local cmp_status, cmp_lsp = pcall(require, "cmp_nvim_lsp")
                    if cmp_status then
                        require("lspconfig")[server_name].setup({ capabilities = cmp_lsp.default_capabilities() })
                    else
                        require("lspconfig")[server_name].setup({})
                    end

                    -- created an autocommand to attach the keybinds after the lspattach event
                    vim.api.nvim_create_autocmd("LspAttach", {
                        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                        callback = function(ev)
                            local function _opts(desc)
                                return { buffer = ev.buf, desc = desc }
                            end

                            local function _map(mode, key, fn, desc)
                                vim.keymap.set(mode, key, fn, _opts(desc))
                            end

                            -- Enable completion triggered by <c-x><c-o>. No idea what this does tbh.
                            vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                            _map("n", "<leader>lf", vim.lsp.buf.format, "Format buffer")
                            _map("n", "<leader>lh", vim.lsp.buf.hover, "Show hover")
                            _map("n", "<leader>ls", vim.lsp.buf.signature_help, "Show signature help")
                            _map("n", "<leader>lR", vim.lsp.buf.rename, "Rename")
                            _map("n", "<leader>la", vim.lsp.buf.code_action, "Code action")
                            _map("n", "<leader>ln", vim.diagnostic.goto_next, "Goto next diagnostic")
                            _map("n", "<leader>lp", vim.diagnostic.goto_prev, "Goto prev diagnostic")
                            -- these binds will be overwritten by telescope if it's available
                            _map("n", "<leader>ld", vim.lsp.buf.definition, "Goto definition")
                            _map("n", "<leader>lI", vim.lsp.buf.implementation, "Goto Implementation")
                            _map("n", "<leader>lt", vim.lsp.buf.type_definition, "Goto type definition")
                            _map("n", "<leader>lr", vim.lsp.buf.references, "Show references")

                            -- use telescope for goto and finding stuff (if available)
                            local status, _ = pcall(require, "telescope")
                            if status then
                                _map("n", "<leader>ld", u._cmd("Telescope lsp_definitions"), "Find definitions")
                                _map("n", "<leader>lD", u._cmd("Telescope diagnostics"), "Find diagnostics")
                                _map("n", "<leader>li", u._cmd("Telescope lsp_incoming_calls"), "Incoming calls")
                                _map("n", "<leader>lI", u._cmd("Telescope lsp_implementations"), "Find implementations")
                                _map("n", "<leader>lo", u._cmd("Telescope lsp_outgoing_calls"), "Outgoing calls")
                                _map(
                                    "n",
                                    "<leader>lt",
                                    u._cmd("Telescope lsp_type_definitions"),
                                    " Find type definition"
                                )
                                _map("n", "<leader>lr", u._cmd("Telescope lsp_references"), "Find references")
                            end
                        end,
                    })
                end,
            },
        })
        -- configure diagnostics
        vim.diagnostic.config({
            virtual_text = false,
            signs = true,
            underline = true,
            update_in_insert = true,
            severity_sort = true,
        })
    end,
}
