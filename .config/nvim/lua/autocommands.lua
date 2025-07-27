local my_group = vim.api.nvim_create_augroup("MyGroup", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
    group = my_group,
    pattern = "*",
    callback = function(args)
        local conform_ok, conform = pcall(require, "conform")
        if not (conform_ok and conform) then
            return
        end
        conform.format({ bufnr = args.buf })
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

-- Create mapping to show/hide dot-files for mini.files
local show_dotfiles = false

local filter_show = function()
    return true
end

local filter_hide = function(fs_entry)
    return not vim.startswith(fs_entry.name, ".")
end

local toggle_dotfiles = function()
    show_dotfiles = not show_dotfiles
    local new_filter = show_dotfiles and filter_show or filter_hide
    MiniFiles.refresh({ content = { filter = new_filter } })
end

vim.api.nvim_create_autocmd("User", {
    pattern = "MiniFilesBufferCreate",
    callback = function(args)
        local buf_id = args.data.buf_id
        -- Tweak left-hand side of mapping to your liking
        vim.keymap.set("n", "g.", toggle_dotfiles, { buffer = buf_id })
    end,
})
