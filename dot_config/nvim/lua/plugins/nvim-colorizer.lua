return {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
        filetypes = {
            html = {
                names = false,
            },
            "css",
            "javascript",
        },
        user_default_options = {
            css = true,
            tailwind = true,
            tailwind_opts = {
                update_names = true,
            },
            sass = { enable = true, parsers = { "css" } },
        },
    },
}
