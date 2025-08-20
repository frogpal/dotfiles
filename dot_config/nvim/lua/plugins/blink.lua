return {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = { "rafamadriz/friendly-snippets" },
    event = "InsertEnter",
    opts = {
        keymap = {
            preset = "super-tab",
            ["<C-u>"] = { "scroll_documentation_up", "fallback" },
            ["<C-d>"] = { "scroll_documentation_down", "fallback" },
        },
        completion = {
            trigger = {
                show_in_snippet = false,
            },
            menu = {
                draw = {
                    treesitter = { "lsp" },
                    columns = {
                        { "label", "label_description", gap = 1 },
                        { "kind_icon", "kind" },
                    },
                },
                border = "single",
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
                treesitter_highlighting = true,
                window = {
                    border = "single",
                },
            },
        },
        appearance = {
            nerd_font_variant = "normal",
        },
        -- enabled = function()
        --     return not vim.tbl_contains({ "markdown", "text", "csv", "json", "xml" }, vim.bo.filetype)
        -- end,
        cmdline = {
            enabled = false,
        },
    },
}
