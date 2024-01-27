return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
        check_ts = true,
    },
    config = function(_, opts)
        require("nvim-autopairs").setup(opts)

        -- Setup autopairs to place nice with cmp
        local status, cmp = pcall(require, "cmp")
        if status then
            cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
        end
    end,
}
