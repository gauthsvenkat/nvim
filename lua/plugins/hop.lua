local u = require("utils")

return {
    "smoka7/hop.nvim",
    init = function()
        u.register_group_with_whichkey("<leader><leader>", "HopWord")
    end,
    opts = {},
    keys = {
        { "<leader><leader>", u._cmd("HopWord"), "Hop to any word in buffer" },
    },
}
