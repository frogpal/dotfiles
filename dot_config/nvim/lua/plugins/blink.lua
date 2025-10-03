return {
    "saghen/blink.cmp",
    version = "1.*",
    event = "InsertEnter",
    opts = {
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
            providers = {
                snippets = {
                    -- HIDE SNIPPETS AFTER TRIGGER CHARACTER
                    should_show_items = function(ctx)
                        return ctx.trigger.initial_kind ~= "trigger_character"
                    end,
                },
            },
        },
        keymap = {
            preset = "super-tab",
            ["<C-u>"] = { "scroll_documentation_up", "fallback" },
            ["<C-d>"] = { "scroll_documentation_down", "fallback" },
        },
        completion = {
            trigger = {
                show_in_snippet = false,
                show_on_trigger_character = true,
            },
            keyword = {
                range = "full",
            },
            list = {
                max_items = 500,
                selection = {
                    preselect = true,
                    auto_insert = false,
                },
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
                auto_show = false,
                auto_show_delay_ms = 500,
                treesitter_highlighting = true,
                window = {
                    border = "single",
                },
            },
        },
        fuzzy = {
            implementation = "prefer_rust_with_warning",
            sorts = {
                "score",
                "sort_text",
                "label",
            },
        },
        appearance = {
            nerd_font_variant = "normal",
        },
        enabled = function()
            return not vim.tbl_contains({ "markdown", "text", "csv", "json", "xml", "tex" }, vim.bo.filetype)
        end,
        cmdline = {
            enabled = false,
        },
    },
}
