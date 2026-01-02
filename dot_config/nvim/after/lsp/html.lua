return {
    cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = { "html", "htm", "templ" },
    init_options = {
        configurationSection = { "html", "css", "javascript" },
        embeddedLanguages = {
            css = true,
            javascript = true,
        },
        provideFormatter = false,
    },
    settings = {
        css = {
            validate = false, -- Disable CSS validation to avoid the error
            lint = {
                validProperties = {}, -- Or set to empty table if validate=true
            },
        },
    },
    root_markers = { "package.json", ".git" },
}
