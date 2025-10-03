return {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    lazy = true,
    cmd = "ConformInfo",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "ruff_format", "ruff_organize_imports" },
            sh = { "shfmt" },
            html = { "deno_fmt" },
            css = { "deno_fmt" },
            javascript = { "deno_fmt" },
            typescript = { "deno_fmt" },
            json = { "deno_fmt" },
            jsonc = { "deno_fmt" },
            -- markdown = { "deno_fmt" },
        },
        formatters = {
            stylua = {
                prepend_args = function()
                    local shiftwidth = vim.api.nvim_get_option_value("shiftwidth", { scope = "local" })
                        or vim.api.nvim_get_option_value("shiftwidth", { scope = "global" })
                    local expandtab = vim.api.nvim_get_option_value("expandtab", { scope = "local" })
                        or vim.api.nvim_get_option_value("expandtab", { scope = "global" })
                    return {
                        "--indent-type",
                        expandtab and "Spaces" or "Tabs",
                        "--indent-width",
                        tostring(shiftwidth),
                    }
                end,
            },
            deno_fmt = {
                append_args = function()
                    local indentwidth = vim.api.nvim_get_option_value("shiftwidth", { scope = "local" })
                        or vim.api.nvim_get_option_value("shiftwidth", { scope = "global" })
                    return {
                        "--indent-width",
                        indentwidth,
                    }
                end,
            },
        },
    },
}
