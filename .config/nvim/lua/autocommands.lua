local my_group = vim.api.nvim_create_augroup("MyGroup", { clear = true })
local enable_wrap = vim.api.nvim_create_augroup("EnableWrapForTextFiles", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
    group = my_group,
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })

        -- local path = vim.fn.expand("%:p:h")
        -- vim.cmd("silent! lcd " .. path)
    end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    desc = "Highlight when yanking text",
    group = my_group,
    callback = function()
        vim.hl.on_yank()
    end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    group = my_group,
    pattern = "lua",
    callback = function()
        vim.keymap.set("n", "<leader>so", ":luafile %<CR>", {
            buffer = true,
            silent = true,
            desc = "Run current lua file",
        })
    end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    group = enable_wrap,
    pattern = { "markdown", "tex", "text", "srt" },
    callback = function()
        vim.opt_local.wrap = true
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = true }),
    callback = function(args)
        local bufnr = args.buf

        local snacks_ok, snacks = pcall(require, "snacks")
        if not snacks_ok or not snacks.words then
            return
        end

        vim.keymap.set({ "n", "t" }, "]]", function()
            snacks.words.jump(vim.v.count1)
        end, { buffer = bufnr, desc = "Next Reference" })

        vim.keymap.set({ "n", "t" }, "[[", function()
            snacks.words.jump(-vim.v.count1)
        end, { buffer = bufnr, desc = "Prev Reference" })
    end,
})
