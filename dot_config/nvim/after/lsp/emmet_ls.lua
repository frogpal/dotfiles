return {
    cmd = { "emmet-ls", "--stdio" },
    filetypes = {
        "html",
        "css",
        "typescriptreact",
        "javascriptreact",
        "javascript",
        "less",
        "sass",
        "scss",
        "svelte",
        "vue",
    },
    init_options = {
        html = {
            options = {
                ["bem.enabled"] = true,
                ["output.selfClosingStyle"] = "xhtml",
            },
        },
    },
}
