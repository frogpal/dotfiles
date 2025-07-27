return {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    lazy = true,
    cmd = "ConformInfo",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "black" },
            html = { "prettierd", "prettier" },
            css = { "prettierd", "prettier" },
            javascript = { "deno_fmt" },
            sh = { "shfmt" },
        },
        formatters = {
            stylua = {
                prepend_args = function(bufnr)
                    local shiftwidth = vim.opt_local.shiftwidth[bufnr] or vim.opt.shiftwidth:get()
                    local expandtab = vim.opt_local.expandtab[bufnr] or vim.opt.expandtab:get()
                    return {
                        "--indent-type",
                        expandtab and "Spaces" or "Tabs",
                        "--indent-width",
                        tostring(shiftwidth),
                    }
                end,
            },
            prettier = {
                inherit = false,
                command = "prettier",
                args = {
                    "--tab-width",
                    "4",
                    "--print-width",
                    "120",
                    "--stdin-filepath",
                    "$FILENAME",
                },
            },
            deno_fmt = {
                command = "deno",
                args = {
                    "fmt",
                    "--indent-width=4",
                    "--line-width=120",
                    "-",
                },
                stdin = true,
            },
        },
    },
}
