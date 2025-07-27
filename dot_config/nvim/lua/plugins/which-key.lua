return {
    "folke/which-key.nvim",
    event = "VimEnter",
    opts = {
        icons = {
            mappings = vim.g.have_nerd_font,
        },
        preset = "helix",
        spec = {
            {
                mode = { "n", "v" },
                { "<leader>f", group = "file/find" },
                { "<leader>g", group = "git" },
                { "<leader>s", group = "search" },
                { "gx", desc = "Open with system app" },
            },
        },
    },
}
