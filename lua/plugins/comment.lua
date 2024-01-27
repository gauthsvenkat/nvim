return {
    "numToStr/Comment.nvim",
    opts = {
        ---LHS of toggle mappings in NORMAL mode
        mappings = {
            basic = true,
            extra = true,
        },
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
        extra = {
            ---Add comment on the line above
            above = "<leader>/O",
            ---Add comment on the line below
            below = "<leader>/o",
            ---Add comment at the end of line
            eol = "<leader>/A",
        },
    },
    keys = { "<leader>/", "<leader>?" },
}
