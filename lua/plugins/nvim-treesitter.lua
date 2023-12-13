-- TODO : figure out incremental selection
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = { "python", "c", "lua", "vim", "vimdoc", "query", "html", "markdown", "markdown_inline" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
