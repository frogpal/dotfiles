return {
    "nvimdev/lspsaga.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    event = "LspAttach",
    opts = {
        symbol_in_winbar = {
            enable = false,
        },
        hover = {
            max_width = 0.5,
        },
        lightbulb = {
            enable = false,
        },
    },
}
