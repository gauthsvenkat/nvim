return {
    "unblevable/quick-scope",
    -- config doesn't work for some reason but using init does
    init = function()
        vim.g.qs_highlight_on_keys = { "f", "F" }
    end,
}
