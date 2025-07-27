vim.lsp.enable({ "lua_ls", "pyright", "intelephense", "html", "cssls", "ts_ls", "clangd" })

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
        },
    },
    virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
        current_line = true,
    },
    severity_sort = true,
    underline = true,
})

vim.lsp.config("*", {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
    root_markers = { ".git" },
})
