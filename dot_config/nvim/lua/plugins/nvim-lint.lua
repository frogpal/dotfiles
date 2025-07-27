return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            -- markdown = { "proselint" },
        }

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = vim.api.nvim_create_augroup("lint", { clear = true }),
            callback = function()
                require("lint").try_lint()
            end,
        })

        vim.keymap.set("n", "<leader>ll", function()
            require("lint").try_lint()
        end, { desc = "Trigger linting for current file" })
    end,
}
