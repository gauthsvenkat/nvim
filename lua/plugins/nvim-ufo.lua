local u = require("utils")

return {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async", "nvim-treesitter/nvim-treesitter" },
    init = function()
        u.register_group_with_whichkey("<leader>z", "Fold")
    end,
    opts = {
        provider_selector = function(bufnr, filetype, buftype)
            return { "treesitter", "indent" }
        end,
    },
    keys = {
        { "<leader>zz", "za", desc = "Toggle fold" },
        { "<leader>zo", "zR", desc = "Open all folds" },
        { "<leader>zc", "zM", desc = "Close all folds" },
    },
}
