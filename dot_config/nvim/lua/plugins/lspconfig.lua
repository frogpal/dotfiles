return {
    {
        "mason-org/mason.nvim",
        build = ":MasonUpdate",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "⏳",
                    package_uninstalled = "✗",
                },
            },
        },
    },
    -- {
    --     "mason-org/mason-lspconfig.nvim",
    --     -- _event = { "BufReadPre", "BufNewFile" },
    --     -- _dependencies = {
    --     --     "mason-org/mason.nvim",
    --     --     "neovim/nvim-lspconfig",
    --     -- },
    --     opts = {
    --         ensure_installed = {
    --             "lua_ls",
    --             "html",
    --             "cssls",
    --             "pyright",
    --             "ts_ls",
    --             "intelephense",
    --             "clangd",
    --         },
    --     },
    -- },
    {
        "neovim/nvim-lspconfig",
    },
}
