vim.keymap.set("n", "<leader>so", ":luafile %<CR>", {
    buffer = true,
    silent = true,
    desc = "Run current lua file",
})
