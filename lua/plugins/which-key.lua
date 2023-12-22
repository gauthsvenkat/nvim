return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        local wk = require("which-key")
        wk.setup()

        wk.register({
            e = {
                name = "Explorer",
                e = { "<cmd>NvimTreeToggle<cr>", "Toggle Explorer" },
                f = { "<cmd>NvimTreeFindFile<cr>", "Find current file in Explorer" },
                c = { "<cmd>NvimTreeCollapse<cr>", "Collapse tree" },
            },
            f = {
                name = "Telescope",
                f = { "<cmd>Telescope find_files<cr>", "Find files" },
                t = { "<cmd>Telescope live_grep<cr>", "Find file with matching text" },

                d = { "<cmd>Telescope diagnostics<cr>", "Find diagnoses" },
                e = { "<cmd>Telescope lsp_definitions<cr>", "Goto or show definitions for current word" },
                r = { "<cmd>Telescope lsp_references<cr>", "Find references for current word" },
                i = { "<cmd>Telescope lsp_implementations<cr>", "Goto or show implementations for current word" },

                b = { "<cmd>Telescope buffers<cr>", "Find buffer" },
                c = { "<cmd>Telescope command_history<cr>", "Find command in history" },
                k = { "<cmd>Telescope keymaps<cr>", "Find (normal mode) keymaps" },
                v = { "<cmd>Telescope treesitter<cr>", "Find (treesitter) variables" },
            },
            -- Use space to Hop around in the buffer
            ["<leader>"] = { "<cmd>HopWord<cr>", "Hop to any word in buffer" },
            l = {
                name = "LSP functions",
                d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Goto definition" },
                D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Goto declaration" },
                i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Goto implementation" },
                t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Goto type definition" },
                f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format buffer" },
                h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Show hover" },
                s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Show signature help" },
                R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
                r = { "<cmd>lua vim.lsp.buf.references()<cr>", "Show references" },
                a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action" },
                n = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Goto next diagnostic" },
                p = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Goto prev diagnostic" },
            },
            n = {
                name = "NeoTest",
                r = { "<cmd>lua require('neotest').run.run()<cr>", "Run nearest test" },
                d = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug nearest test" },
                f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run current file" },
                s = { "<cmd>Neotest summary<cr>", "Toggle test summary" },
                o = { "<cmd>Neotest output<cr>", "Toggle test output" },
            },
            p = {
                name = "Plugins",
                p = { "<cmd>Lazy<cr>", "Open Lazy" },
                m = { "<cmd>Mason<cr>", "Open Mason" },
                t = {
                    name = "Treesitter",
                    i = { "<cmd>TSInstallInfo<cr>", "Install treesitter info" },
                    c = { "<cmd>TSConfigInfo<cr>", "Show treesitter config" },
                },
                l = {
                    name = "LSP",
                    i = { "<cmd>LspInfo<cr>", "Show LSP info" },
                    l = { "<cmd>LspLog<cr>", "Show LSP log" },
                },
                c = {
                    name = "Copilot",
                    s = { "<cmd>Copilot status<cr>", "Show Copilot status" },
                    t = { "<cmd>Copilot toggle<cr>", "Toggle Copilot" },
                    p = { "<cmd>Copilot panel<cr>", "Open panel suggestions" },
                },
                n = {
                    name = "NullLs",
                    i = { "<cmd>NullLsInfo<cr>", "Show NullLs info" },
                    l = { "<cmd>NullLsLog<cr>", "Show NullLs log" },
                },
            },
            -- s and S reserved for treesitter
            t = {
                name = "Terminal",
                t = { "<cmd>ToggleTerm direction=horizontal size=10<cr>", "Bottom terminal" },
                f = { "<cmd>ToggleTerm direction=float<cr>", "Floating terminal" },
            },
            z = {
                name = "Fold",
                z = { "za", "Toggle fold" },
                o = { "zR", "Open all folds" },
                c = { "zM", "Close all folds" },
            },
        }, {
            mode = "n", -- NORMAL mode
            prefix = "<leader>",
            buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
            silent = true, -- use `silent` when creating keymaps
            noremap = true, -- use `noremap` when creating keymaps
            nowait = false, -- use `nowait` when creating keymaps
            expr = false, -- use `expr` when creating keymaps
        })
    end,
}
