vim.lsp.enable({
    "lua_ls",
    "basedpyright",
    "intelephense",
    "html",
    "cssls",
    "tailwindcss",
    "ts_ls",
    "clangd",
    "ansiblels",
    -- "dockerls",
    -- "emmet_ls",
    "ruff",
    "vimls",
    -- "texlab",
})

vim.lsp.config("*", {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
})

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
