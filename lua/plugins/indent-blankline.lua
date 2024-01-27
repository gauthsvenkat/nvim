local u = require("utils")

return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    init = function()
        u.register_group_with_whichkey("<leader>i", "Indent Blankline")
    end,
    opts = { enabled = false },
    keys = {
        { "<leader>ii", u._cmd("IBLToggle"), desc = "Toggle indent" },
        { "<leader>is", u._cmd("IBLToggleScope"), desc = "Toggle indent scope" },
    },
}
