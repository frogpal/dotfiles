return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    branch = "master",
    -- cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    config = function ()
        local configs = require("nvim-treesitter.configs")
        ---@diagnostic disable-next-line: missing-fields
        configs.setup({
            ensure_installed = {
                "bash",
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
            indent = { enable = true },
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
}
