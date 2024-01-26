local u = require("utils")

return {
    "nvim-tree/nvim-tree.lua",
    opts = { renderer = { highlight_git = true } },
    init = function()
        u.register_group_with_whichkey("<leader>e", "Explorer")
    end,
    config = function(_, opts)
        require("nvim-tree").setup(opts)
    end,
    keys = {
        { "<leader>ee", u._cmd("NvimTreeToggle"), desc = "Toggle Explorer" },
        { "<leader>ef", u._cmd("NvimTreeFindFile"), desc = "Find current file in Explorer" },
    },
}
