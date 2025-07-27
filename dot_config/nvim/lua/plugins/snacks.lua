return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        -- bigfile = { enabled = true },
        dashboard = { enabled = true },
        indent = {
            indent = {
                enabled = true,
                only_scope = true,
            },
        },
        quickfile = { enabled = true },
        words = { enabled = true },
    },
}
