return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            theme = "auto",
            globalstatus = vim.o.laststatus == 3,
        },
        -- sections = {
        --     lualine_a = { "mode" },
        --     lualine_b = { "branch" },
        -- },
    },
}
