return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
        branch = "master",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = {
                    "bash",
                    "css",
                    "diff",
                    "html",
                    "javascript",
                    "jsdoc",
                    "json",
                    "jsonc",
                    "lua",
                    "luadoc",
                    "markdown",
                    "markdown_inline",
                    "python",
                    "regex",
                    "toml",
                    "tsx",
                    "typescript",
                    "vim",
                    "vimdoc",
                    "xml",
                    "yaml",
                },
                sync_install = false,
                auto_install = false,
                highlight = { enable = true },
                indent = { enable = false },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-space>",
                        node_incremental = "<C-space>",
                        scope_incremental = "grc",
                        node_decremental = "<bs>",
                    },
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        lazy = false,
        keys = {
            {
                "[c",
                function()
                    require("treesitter-context").go_to_context(vim.v.count1)
                end,
                desc = "Treesitter go to context",
            },
        },
        opts = {
            max_lines = 7,
        },
        config = function(_, opts)
            require("treesitter-context").setup(opts)
            vim.api.nvim_set_hl(0, "TreesitterContextBottom", {})
        end,
    },
}
