return {
    "windwp/nvim-autopairs",
    dependencies = { "hrsh7th/nvim-cmp" },
    opts = {
        check_ts = true,
    },
    config = function(_, opts)
        require("nvim-autopairs").setup(opts)

        -- Setup autopairs to place nice with cmp
        local cmp = require("cmp")
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")

        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
}
