return {
    "numToStr/Comment.nvim",
    opts = {
        ---LHS of toggle mappings in NORMAL mode
        toggler = {
            ---Line-comment toggle keymap
            line = "gcc",
            ---Block-comment toggle keymap
            block = "gbc",
        },
        ---LHS of operator-pending mappings in NORMAL and VISUAL mode
        opleader = {
            ---Line-comment keymap
            line = "gc",
            ---Block-comment keymap
            block = "gb",
        },
        extra = {
            ---Add comment on the line above
            above = "gcO",
            ---Add comment on the line below
            below = "gco",
            ---Add comment at the end of line
            eol = "gcA",
        },
        mappings = {
            ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
            basic = true,
            ---Extra mapping; `gco`, `gcO`, `gcA`
            extra = true,
        },
    },
}
