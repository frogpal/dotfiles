return {
    "echasnovski/mini.nvim",
    version = false,
    lazy = false,
    opts = {},
    config = function()
        require("mini.files").setup({
            options = {
                permanent_delete = false,
                use_as_default_explorer = true,
            },
            windows = {
                -- preview = true,
                width_focus = 30,
                width_preview = 30,
            },
            mappings = {
                go_in_plus = "<CR>",
            },
            -- content = {
            --     filter = function(fs_entry)
            --         return not vim.startswith(fs_entry.name, ".") -- Hide dotfiles by default
            --     end,
            -- },
        })
        require("mini.pairs").setup({
            modes = { insert = false, command = true },
        })
        require("mini.notify").setup({
            lsp_progress = { enable = false },
        })
        require("mini.icons").setup()
        require("mini.move").setup()
        require("mini.statusline").setup()
        require("mini.splitjoin").setup()
    end,
    keys = {
        {
            "<leader>e", -- TODO configure it to not open in terminal buffers
            function()
                if not MiniFiles.close() then
                    -- Taken from https://github.com/echasnovski/mini.nvim/issues/1146
                    local buf_name = vim.api.nvim_buf_get_name(0)
                    local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
                    MiniFiles.open(path)
                end
            end,
            desc = "Mini Files",
            mode = { "n", "t" },
        },
        {
            "<leader>E",
            function()
                if not MiniFiles.close() then
                    MiniFiles.open(vim.uv.cwd())
                end
            end,
            desc = "Mini Files",
            mode = { "n", "t" },
        },
    },
}
