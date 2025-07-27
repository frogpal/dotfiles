return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
        flavour = "mocha",
        integrations = {
            treesitter = true,
            blink_cmp = true,
        },
    },
    config = function()
        vim.cmd.colorscheme("catppuccin-mocha")
    end,
}
