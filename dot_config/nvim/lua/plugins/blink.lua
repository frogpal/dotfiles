return {
    "saghen/blink.cmp",
    version = "1.*",
    event = "InsertEnter",
    opts = {
        sources = {
            per_filetype = {
                sql = { "snippets", "dadbod", "buffer" },
            },
            providers = {
                snippets = {
                    -- HIDE SNIPPETS AFTER TRIGGER CHARACTER
                    should_show_items = function(ctx)
                        return ctx.trigger.initial_kind ~= "trigger_character"
                    end,
                },
                dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
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
                range = "prefix",
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
                        { "kind_icon", "kind", "source_name", gap = 1 },
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
            -- sorts = {
            --     "exact",
            --     "score",
            --     "sort_text",
            --     "label",
            -- },
        },
        enabled = function()
            return not vim.tbl_contains({ "markdown", "text", "csv", "json", "xml", "tex" }, vim.bo.filetype)
        end,
        cmdline = {
            enabled = false,
        },
    },
    config = function(_, opts)
        require("blink.cmp").setup(opts)
        local source_priority = {
            snippets = 4,
            lsp = 3,
            path = 2,
            buffer = 1,
        }
        opts.fuzzy.sorts = {
            function(a, b)
                local a_priority = source_priority[a.source_id]
                local b_priority = source_priority[b.source_id]
                if a_priority ~= b_priority then
                    return a_priority > b_priority
                end
            end,
            -- defaults
            "score",
            "sort_text",
        }
    end,
}
