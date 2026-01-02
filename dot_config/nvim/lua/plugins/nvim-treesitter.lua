return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        branch = "main",
        build = function()
            local TS = require("nvim-treesitter")
            if not vim.fn.executable("tree-sitter") then
                vim.notify("`tree-sitter` does not exist in your PATH. You better install it.")
            end
            TS.update(nil, { summary = true })
        end,
        opts = {
            indent = { enable = false },
            highlight = { enable = true },
            folds = { enable = true },
            ensure_installed = {
                "bash",
                "css",
                "csv",
                "diff",
                "dockerfile",
                "editorconfig",
                "html",
                "javascript",
                "jsdoc",
                "json",
                "jsonc",
                "lua",
                "luadoc",
                "luap",
                "markdown",
                "markdown_inline",
                "python",
                "regex",
                "sql",
                "toml",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "xml",
                "yaml",
            },
        },
        config = function(_, opts)
            local TS = require("nvim-treesitter")
            local languages = opts.ensure_installed
            local exclude = "html"

            TS.setup(opts)
            TS.install(languages)

            local filtered_patterns = vim.tbl_filter(function(pattern)
                return pattern ~= exclude
            end, languages)

            vim.api.nvim_create_autocmd("FileType", {
                pattern = languages,
                callback = function()
                    vim.treesitter.start()
                    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                end,
            })

            -- set indentexpr to all files except the excluded ones
            vim.api.nvim_create_autocmd("FileType", {
                pattern = filtered_patterns,
                callback = function()
                    vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
                end,
            })
        end,
    },
    -- {
    --     "nvim-treesitter/nvim-treesitter",
    --     event = { "BufReadPost", "BufNewFile" },
    --     cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    --     build = ":TSUpdate",
    --     branch = "master",
    --     config = function()
    --         local configs = require("nvim-treesitter.configs")
    --         configs.setup({
    --             ensure_installed = {
    --                 "bash",
    --                 "css",
    --                 "diff",
    --                 "dockerfile",
    --                 "editorconfig",
    --                 "html",
    --                 "javascript",
    --                 "jsdoc",
    --                 "json",
    --                 "jsonc",
    --                 "lua",
    --                 "luadoc",
    --                 "markdown",
    --                 "markdown_inline",
    --                 "python",
    --                 "regex",
    --                 "toml",
    --                 "tsx",
    --                 "typescript",
    --                 "vim",
    --                 "vimdoc",
    --                 "xml",
    --                 "yaml",
    --             },
    --             sync_install = false,
    --             auto_install = false,
    --             highlight = {
    --                 enable = true,
    --             },
    --             indent = { enable = false },
    --             incremental_selection = {
    --                 enable = true,
    --                 keymaps = {
    --                     init_selection = "<C-space>",
    --                     node_incremental = "<C-space>",
    --                     scope_incremental = "grc",
    --                     node_decremental = "<bs>",
    --                 },
    --             },
    --         })
    --     end,
    -- },
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
