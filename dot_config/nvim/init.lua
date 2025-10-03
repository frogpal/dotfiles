require("options")
require("core.lazy")
require("keymaps")
require("autocommands")
require("remove_comments")

-- Add this function to your init.lua or create a separate file and call it when needed

-- Function to inspect LSP capabilities and trigger characters
local function inspect_lsp_capabilities()
    local clients = vim.lsp.get_clients({ bufnr = 0 })

    if #clients == 0 then
        print("No LSP clients attached to current buffer")
        return
    end

    for _, client in ipairs(clients) do
        print("\n=== LSP Client: " .. client.name .. " ===")

        local caps = client.server_capabilities
        if not caps then
            print("No server capabilities found")
            goto continue
        end

        -- Check completion provider capabilities
        if caps.completionProvider then
            print("Completion Provider: YES")

            -- Trigger characters
            if caps.completionProvider.triggerCharacters then
                print("Trigger Characters: " .. vim.inspect(caps.completionProvider.triggerCharacters))
            else
                print("Trigger Characters: NONE")
            end

            -- All commit characters
            if caps.completionProvider.allCommitCharacters then
                print("All Commit Characters: " .. vim.inspect(caps.completionProvider.allCommitCharacters))
            else
                print("All Commit Characters: NONE")
            end

            -- Resolve provider
            if caps.completionProvider.resolveProvider then
                print("Resolve Provider: YES")
            else
                print("Resolve Provider: NO")
            end

            -- Work done progress
            if caps.completionProvider.workDoneProgress then
                print("Work Done Progress: YES")
            else
                print("Work Done Progress: NO")
            end
        else
            print("Completion Provider: NO")
        end

        -- Signature help trigger characters (also relevant for completion)
        if caps.signatureHelpProvider and caps.signatureHelpProvider.triggerCharacters then
            print("Signature Help Triggers: " .. vim.inspect(caps.signatureHelpProvider.triggerCharacters))
        end

        ::continue::
    end
end

-- Create a command to easily call this function
vim.api.nvim_create_user_command("LspInspectTriggers", inspect_lsp_capabilities, {})

-- Alternative: Add a keymap for quick access
vim.keymap.set("n", "<leader>lt", inspect_lsp_capabilities, { desc = "Inspect LSP trigger characters" })

-- Function to test trigger characters in real-time
local function test_trigger_character(char)
    local clients = vim.lsp.get_clients({ bufnr = 0 })

    for _, client in ipairs(clients) do
        local caps = client.server_capabilities
        if caps and caps.completionProvider and caps.completionProvider.triggerCharacters then
            local triggers = caps.completionProvider.triggerCharacters
            local is_trigger = vim.tbl_contains(triggers, char)
            print(
                string.format(
                    "Client '%s': '%s' is %sa trigger character",
                    client.name,
                    char,
                    is_trigger and "" or "NOT "
                )
            )
        end
    end
end

-- Create command to test specific characters
vim.api.nvim_create_user_command("LspTestTrigger", function(opts)
    if opts.args and opts.args ~= "" then
        test_trigger_character(opts.args)
    else
        print("Usage: :LspTestTrigger <character>")
        print("Example: :LspTestTrigger .")
    end
end, {
    nargs = 1,
    desc = "Test if character is LSP trigger",
})

-- Function to show all LSP info in a floating window
local function show_lsp_info_float()
    local clients = vim.lsp.get_clients({ bufnr = 0 })

    if #clients == 0 then
        vim.notify("No LSP clients attached to current buffer", vim.log.levels.INFO)
        return
    end

    local lines = {}

    for _, client in ipairs(clients) do
        table.insert(lines, "=== " .. client.name .. " ===")

        local caps = client.server_capabilities
        if caps and caps.completionProvider then
            if caps.completionProvider.triggerCharacters then
                table.insert(lines, "Trigger Characters:")
                for _, char in ipairs(caps.completionProvider.triggerCharacters) do
                    table.insert(lines, "  '" .. char .. "'")
                end
            else
                table.insert(lines, "No trigger characters defined")
            end
        else
            table.insert(lines, "No completion provider")
        end
        table.insert(lines, "")
    end

    -- Create floating window
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

    local width = 50
    local height = math.min(#lines + 2, 20)
    local opts = {
        relative = "cursor",
        width = width,
        height = height,
        col = 0,
        row = 1,
        style = "minimal",
        border = "rounded",
    }

    vim.api.nvim_open_win(buf, false, opts)
end

vim.keymap.set("n", "<leader>lf", show_lsp_info_float, { desc = "Show LSP info in float" })
