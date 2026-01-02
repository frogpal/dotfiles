return {
    "hello-world-nvim",
    dir = "~/projects/neovim-plugins/hello-world-nvim/",
    config = function()
        require("hello-world-nvim").setup({
            keymap = "<leader>hi",
        })
    end,
}
