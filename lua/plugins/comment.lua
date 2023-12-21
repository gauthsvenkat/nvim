return {
    "numToStr/Comment.nvim",
    opts = {
        mappings = {
            basic = true,
            -- extra = true,
        },
        ---LHS of toggle mappings in NORMAL mode
        toggler = {
            ---Line-comment toggle keymap
            line = "<leader>//",
            ---Block-comment toggle keymap
            block = "<leader>?/",
        },
        ---LHS of operator-pending mappings in NORMAL and VISUAL mode
        opleader = {
            ---Line-comment keymap
            line = "<leader>/",
            ---Block-comment keymap
            block = "<leader>?",
        },
        -- extra = {
        --     ---Add comment on the line above
        --     above = "gcO",
        --     ---Add comment on the line below
        --     below = "gco",
        --     ---Add comment at the end of line
        --     eol = "gcA",
        -- },
    },
}
