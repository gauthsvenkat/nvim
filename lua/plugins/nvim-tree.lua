local u = require("utils")

return {
    "nvim-tree/nvim-tree.lua",
    init = function()
        u.register_group_with_whichkey("<leader>e", "Explorer")
    end,
    opts = { renderer = { highlight_git = true } },
    keys = {
        { "<leader>ee", u._cmd("NvimTreeToggle"), desc = "Toggle Explorer" },
        { "<leader>ef", u._cmd("NvimTreeFindFile"), desc = "Find current file in Explorer" },
    },
}
